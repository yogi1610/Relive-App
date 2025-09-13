import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AppProviders {
  static MultiProvider getProviders({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BlogsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddFoodLogProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MedicalPlanProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddNewAppointmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditAppointmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProgressReportProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FontSizeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppointmentProvider(),
        ),
      ],
      child: child,
    );
  }
}
