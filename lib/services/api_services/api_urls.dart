class ApiUrls {
  static final ApiUrls _apiMethods = ApiUrls._internal();

  factory ApiUrls() {
    return _apiMethods;
  }

  ApiUrls._internal();

  static const apiAccessToken = 'RELIVE-2025';

  /// DEV Base Url
  static const baseUrl = 'https://api.relive.co.il/app/';
  static const envType = 'dev';

  /// LIVE Base Url
  // static const baseUrl = '';
  // static const envType = 'live';

  /// End Points
  static const sendOtp = '${baseUrl}send-otp';
  static const verifyOtp = '${baseUrl}verify-otp';
  static const login = '${baseUrl}login';
  static const patientInfo = '${baseUrl}patient-info';
  static const logout = '${baseUrl}logout';
  static const storePatientPainScore = '${baseUrl}store-patient-pain-score';
  static const getAllBlogs = '${baseUrl}get-all-blogs';
}
