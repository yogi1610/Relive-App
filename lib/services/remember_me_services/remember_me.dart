import 'package:relive_app/constants/app_keys.dart';
import 'package:relive_app/utils/app_storage.dart';

class RememberMe {
  final String? phoneEmail;

  RememberMe({this.phoneEmail});

  void setData() async {
    AppStorageManager.saveData(AppKeys.rememberMeStatus, true);
    AppStorageManager.saveData(AppKeys.phoneOrEmail, phoneEmail.toString());
  }

  static void clearData() {
    AppStorageManager.saveData(AppKeys.rememberMeStatus, false);
    AppStorageManager.saveData(AppKeys.phoneOrEmail, "");
  }

  static Future<Map<String, dynamic>> readData() async {
    String phoneEmail =
        await AppStorageManager.readData(AppKeys.phoneOrEmail) ?? '';
    bool rememberMeStatus =
        await AppStorageManager.readData(AppKeys.rememberMeStatus) ?? false;
    return {
      AppKeys.phoneOrEmail: phoneEmail,
      AppKeys.rememberMeStatus: rememberMeStatus,
    };
  }
}
