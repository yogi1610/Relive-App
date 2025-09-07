import 'package:flutter/material.dart';
import 'package:relive_app/providers/add_food_log_provider.dart';
import 'package:relive_app/providers/blogs_provider.dart';
import 'package:relive_app/providers/medical_plan_provider.dart';
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
      ],
      child: child,
    );
  }
}
