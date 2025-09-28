class ApiUrls {

  static final ApiUrls _apiMethods = ApiUrls._internal();

  factory ApiUrls() {
    return _apiMethods;
  }

  ApiUrls._internal();

  static const apiAccessToken = 'RELIVE-2025';

  /// DEV Base Url
  static const baseUrl = 'https://api.relive.co.il/app/';

  /// LIVE Base Url
  // static const baseUrl = '';

  /// End Points
  static const sendOtp = '${baseUrl}send-otp';
  static const verifyOtp = '${baseUrl}verify-otp';
  static const login = '${baseUrl}login';
}
