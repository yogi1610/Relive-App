import 'package:relive_app/utils/app_files_imports.dart';

class CheckInternet {
  static final CheckInternet _instance = CheckInternet._internal();

  factory CheckInternet() => _instance;

  CheckInternet._internal();

  static Future<bool> isInternetConnected() async {
    InternetConnection internet = InternetConnection();
    bool isInterConnect = await internet.hasInternetAccess;
    return isInterConnect;
  }
}
