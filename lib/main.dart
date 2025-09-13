import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';
import 'dart:ui' as ui;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  var locale = await AppLocalization.getSavedLocale();

  runApp(
    ToastificationWrapper(
      child: AppProviders.getProviders(
        child: EasyLocalization(
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('he', 'HEB'),
            Locale('ar', 'AR'),
          ],
          path: 'assets/translations',
          fallbackLocale: locale,
          child: const MyApp(), // <-- only here
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'Relive',
          navigatorKey: navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: themeProvider.themeMode,
          theme: themeProvider.lightTheme,
          builder: (context, child) {
            return Directionality(
              textDirection: ui.TextDirection.ltr,
              child: ScreenUtilInit(
                designSize: const Size(411, 915),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, _) {
                  return Consumer<FontSizeProvider>(
                    builder: (context, fontProvider, _) {
                      return ScrollConfiguration(
                        behavior: const ScrollBehaviorModified(),
                        child: MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaler: TextScaler.linear(fontProvider.scale),
                          ),
                          child: child!,
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },

          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const AlwaysScrollableScrollPhysics(
          parent: ClampingScrollPhysics(),
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
