import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AuthService {
  Future<void> keepAlwaysLogin(BuildContext context) async {
    bool isInternetConnect = await CheckInternet.isInternetConnected();
    if (!isInternetConnect) {
      AppMessage.error('No Internet Connected');
      return;
    }

    bool isUserLogin =
        await AppStorageManager.readData(AppKeys.isUserLogin) ?? false;

    if (isUserLogin) {
      try {
        if (context.mounted) {
          await Provider.of<DashboardProvider>(
            context,
            listen: false,
          ).patientInfoApi();
        }
      } catch (e) {
        AppMessage.error('Failed to load user info');
      }

      // Dashboard me navigate karo
      if (context.mounted) {
        CustomNavigator.pushAndRemoveUntilWithZeroTransition(
          context,
          DashboardScreen(selectedPage: 0),
        );
      }
    } else {
      if (context.mounted) {
        await Future.delayed(Duration(seconds: 2));
        if (context.mounted) {
          CustomNavigator.pushAndRemoveUntilWithZeroTransition(
            context,
            LoginScreen(),
          );
        }
      }
    }
  }
}
