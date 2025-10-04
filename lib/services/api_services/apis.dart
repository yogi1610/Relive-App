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

  static Future<OtpVerifyResponse> verifyOtp({
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
        return OtpVerifyResponse.fromJson(json.decode(res));
      } catch (e) {
        return OtpVerifyResponse(
          status: false,
          message: 'Something went wrong',
        );
      }
    } else {
      return OtpVerifyResponse(status: false, message: 'Something went wrong');
    }
  }

  static Future<Map<String, dynamic>> loginApi({
    required Map<String, String> body,
  }) async {
    var header = ApiMethods.getHeaderWithoutToken();

    String url = ApiUrls.login;
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

  static Future<Map<String, dynamic>> logout({
    required Map<String, String> body,
  }) async {
    var header = await ApiMethods.getHeaderWithToken();

    String url = ApiUrls.logout;
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

  static Future<PatientInfoResponse?> patientInfo({
    required Map<String, String> body,
  }) async {
    var header = await ApiMethods.getHeaderWithToken();

    String url = ApiUrls.patientInfo;
    String res = await _apiClient.getMethod(
      method: url,
      body: body,
      header: header,
    );

    if (res.isNotEmpty) {
      try {
        return patientInfoResponseFromJson(res);
      } catch (e) {
        AppMessage.error('Parsing error: $e');
        return null;
      }
    } else {
      AppMessage.error('Failed');
      return null;
    }
  }

  static Future<Map<String, dynamic>> storePatientPainScore({
    required Map<String, String> body,
    required List<MultipartFile> files,
    required String mapKeyFile,
    required Function(int, int) onProgress,
  }) async {
    var header = await ApiMethods.getHeaderWithToken();

    String url = ApiUrls.storePatientPainScore;
    String res = await _apiClient.postMultipartMethod(
      method: url,
      body: body,
      files: files,
      mapKeyFile: mapKeyFile,
      onProgress: onProgress,
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

  static Future<BlogsResponse?> getAllBlogs({
    required Map<String, String> body,
  }) async {
    var header = await ApiMethods.getHeaderWithToken();

    String url = ApiUrls.getAllBlogs;
    String res = await _apiClient.getMethod(
      method: url,
      body: body,
      header: header,
    );

    if (res.isNotEmpty) {
      try {
        return blogsResponseFromJson(res);
      } catch (e) {
        AppMessage.error('Parsing error: $e');
        return null;
      }
    } else {
      AppMessage.error('Failed');
      return null;
    }
  }

  static Future<Map<String, dynamic>> createOrUpdateAppointment({
    required Map<String, String> body,
  }) async {
    var header = await ApiMethods.getHeaderWithToken();

    String url = ApiUrls.createOrUpdateAppointment;
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

  static Future<GetAppointmentsResponse?> getDailyAppointments({
    required Map<String, String> body,
  }) async {
    var header = await ApiMethods.getHeaderWithToken();

    String url = ApiUrls.getDailyAppointments;
    String res = await _apiClient.getMethod(
      method: url,
      body: body,
      header: header,
    );

    if (res.isNotEmpty) {
      try {
        return getAppointmentsResponseFromJson(res);
      } catch (e) {
        AppMessage.error('Parsing error: $e');
        return null;
      }
    } else {
      AppMessage.error('Failed');
      return null;
    }
  }

  static Future<Map<String, dynamic>> deleteAppointment({
    required Map<String, String> body,
  }) async {
    var header = await ApiMethods.getHeaderWithToken();

    String url = ApiUrls.deleteAppointment;
    String res = await _apiClient.deleteMethod(
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
