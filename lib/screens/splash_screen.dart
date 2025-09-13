import 'package:flutter/material.dart';
import '../utils/app_files_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToLogin(context);
    super.initState();
  }

  void navigateToLogin(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    if (context.mounted) {
      CustomNavigator.pushAndRemoveUntilWithZeroTransition(
        context,
        LoginScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLocalization.setLanguage(AppLanguage.english, context);
    return AppScaffold(
      showAppBar: false,
      body: Center(
        child: AppImage(imagePath: AppAssets.appLogo, height: 200, width: 200),
      ),
    );
  }
}
