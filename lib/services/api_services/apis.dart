import 'package:relive_app/services/api_services/api_methods.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class Apis {
  static final ApiMethods _apiClient = ApiMethods();

  static final Apis _api = Apis._internal();

  factory Apis() {
    return _api;
  }

  Apis._internal();

  static Future<Map<String, dynamic>> sendOtpLogin({
    required Map<String, String> body,
  }) async {
    var header = ApiMethods.getHeaderWithoutToken();

    String url = ApiUrls.sendOtp;
    String res = await _apiClient.postMethod(
      method: url,
      body: body,
      header: header,
    );
    if (res.isNotEmpty) {
      try {
        return jsonDecode(res);
      } catch (e) {
        AppMessage.error('exception is $e');
        return {};
      }
    } else {
      AppMessage.error('Failed');
      return {};
    }
  }

  static Future<Map<String, dynamic>> verifyOtp({
    required Map<String, String> body,
  }) async {
    var header = ApiMethods.getHeaderWithoutToken();

    String url = ApiUrls.verifyOtp;
    String res = await _apiClient.postMethod(
      method: url,
      body: body,
      header: header,
    );
    if (res.isNotEmpty) {
      try {
        return jsonDecode(res);
      } catch (e) {
        AppMessage.error('exception is $e');
        return {};
      }
    } else {
      AppMessage.error('Failed');
      return {};
    }
  }
}
