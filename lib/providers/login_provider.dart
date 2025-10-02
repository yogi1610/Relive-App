import 'package:flutter/cupertino.dart';
import '../utils/app_files_imports.dart';

class LoginProvider extends ChangeNotifier {
  /// =============== SEND OTP ==============

  LoginProvider() {
    readRememberMe();
  }

  TextEditingController emailPhoneController = TextEditingController();

  final GlobalKey<FormState> _sendOtpFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get sendOtpFormKey => _sendOtpFormKey;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void sendOtp(BuildContext context) {
    if (_sendOtpFormKey.currentState?.validate() ?? false) {
      sendOtpForLoginApi(context: context);
      FocusScope.of(context).unfocus();
    }
  }

  Future<void> sendOtpForLoginApi({
    required BuildContext context,
    bool? isResend,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final body = {ApiKeys.email: emailPhoneController.text};

      final jsonResponse = await Apis.sendOtpLogin(body: body);

      if (jsonResponse[AppConstants.apiStatus] == true) {
        if (isResend == true) {
          if (ApiUrls.envType.toString() == 'dev') {
            AppMessage.success('Otp is ${jsonResponse['otp'].toString()}');
          }
        } else {
          setRememberMe(isRememberCheck);
          if (context.mounted) {
            _onSentOtpSuccess(context);
          }
          if (ApiUrls.envType.toString() == 'dev') {
            AppMessage.success('Otp is ${jsonResponse['otp'].toString()}');
          }
          // start resend timer for first OTP also
          startResendTimer();
        }
      } else {
        setRememberMe(false);
        AppMessage.error(jsonResponse[AppConstants.apiMessage]);
      }
    } catch (e) {
      return;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _onSentOtpSuccess(BuildContext context) {
    CustomNavigator.pushNavigate(
      context: context,
      page: LoginOtpVerifyScreen(),
    );
  }

  /// ============= REMEMBER ME LOGIC =============

  bool isRememberCheck = false;

  void onTapRememberMe(bool? value) {
    if (emailPhoneController.text.isNotEmpty || isRememberCheck) {
      isRememberCheck = value!;
    } else {
      AppMessage.warning('Please fill details');
    }
    notifyListeners();
  }

  void readRememberMe() async {
    Map<String, dynamic> rememberMe = await RememberMe.readData();
    emailPhoneController.text = rememberMe[AppKeys.phoneOrEmail];
    isRememberCheck = rememberMe[AppKeys.rememberMeStatus];
    notifyListeners();
  }

  void setRememberMe(bool status) {
    if (status == true) {
      RememberMe(phoneEmail: emailPhoneController.text.toString()).setData();
    } else {
      RememberMe.clearData();
    }
  }

  /// ============ VERIFY OTP ================
  TextEditingController otpController = TextEditingController();

  final GlobalKey<FormState> _verifyOtpFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get verifyOtpFormKey => _verifyOtpFormKey;

  bool _isVerifyLoading = false;

  bool get isVerifyLoading => _isVerifyLoading;

  void verifyOtp(BuildContext context) {
    if (_verifyOtpFormKey.currentState?.validate() ?? false) {
      verifyOtpForLoginApi(context: context);
      FocusScope.of(context).unfocus();
    }
  }

  Future<void> verifyOtpForLoginApi({required BuildContext context}) async {
    _isVerifyLoading = true;
    notifyListeners();

    try {
      final body = {
        ApiKeys.email: emailPhoneController.text,
        ApiKeys.otp: otpController.text,
      };

      OtpVerifyResponse res = await Apis.verifyOtp(body: body);

      if (res.status == true) {
        AppMessage.success(res.message ?? '');
        if (context.mounted) {
          _onVerifyOtpSuccess(context, res.clinics ?? []);
        }
      } else {
        AppMessage.error(res.message ?? '');
      }
    } catch (e) {
      return;
    } finally {
      _isVerifyLoading = false;
      notifyListeners();
    }
  }

  void _onVerifyOtpSuccess(BuildContext context, List<Clinics> clinicsList) {
    CustomNavigator.pushNavigate(
      context: context,
      page: LoginChooseYourClinicScreen(clinicsList: clinicsList),
    );
  }

  // --------- RESEND OTP ---------
  Timer? _resendTimer;
  int _resendSeconds = 30;

  bool get isResendAvailable => _resendSeconds == 0;

  int get resendSeconds => _resendSeconds;

  void startResendTimer() {
    _resendSeconds = 30;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendSeconds > 0) {
        _resendSeconds--;
        notifyListeners();
      } else {
        timer.cancel();
        notifyListeners();
      }
    });
  }

  Future<void> resendOtp(BuildContext context) async {
    await sendOtpForLoginApi(context: context, isResend: true);
    startResendTimer();
  }

  /// ============ LOGIN ================

  Future<void> loginApi({
    required BuildContext context,
    required String inputData,
    required String clinicId,
  }) async {
    AppUtils.progressLoadingDialog(context, true);
    Map<String, String> body = {};
    body['email'] = inputData;
    body['clinic_id'] = clinicId;
    body['fcm_token'] = 'static_fcm';
    body['device_id'] = 'xx123'; // need to make dynamic
    body['device_type'] = 'IOS'; // need to make dynamic
    body['time_zone'] = 'Asia/Kolkata'; // need to make dynamic
    var jsonResponse = await Apis.loginApi(body: body);
    if (context.mounted) {
      AppUtils.progressLoadingDialog(context, false);
    }
    if (jsonResponse[AppConstants.apiStatus]) {
      await saveUserData(jsonResponse);
      if (context.mounted) {
        AppMessage.success(jsonResponse[AppConstants.apiMessage]);
        _onLoginSuccess(context);
      }
      if (context.mounted) {
        await _updateUserData(context, jsonResponse);
      }
    } else {
      AppMessage.error(jsonResponse[AppConstants.apiMessage]);
    }
  }

  Future<void> _updateUserData(BuildContext context, var res) async {
    final provider = Provider.of<DashboardProvider>(context, listen: false);
    var patient = res['patient'];
    await provider.updateUserData(
      name: patient['name'].toString(),
      email: patient['email'].toString(),
      image: patient['image']?.toString(),
    );
    provider.patientInfoApi();
  }

  void _onLoginSuccess(BuildContext context) {
    CustomNavigator.pushAndRemoveUntill(
      context,
      DashboardScreen(selectedPage: 0),
    );
  }

  Future saveUserData(var res) async {
    var data = res['patient'];
    AppStorageManager.saveData(AppKeys.authToken, res['token'].toString());
    AppStorageManager.saveData(AppKeys.userId, data['id'].toString());
    AppStorageManager.saveData(AppKeys.userName, data['name'].toString());
    AppStorageManager.saveData(AppKeys.userEmail, data['email'].toString());
    AppStorageManager.saveData(AppKeys.uniqueId, data['unique_id'].toString());
    AppStorageManager.saveData(AppKeys.clinicId, data['clinic_id'].toString());
    AppStorageManager.saveData(AppKeys.isUserLogin, true);
  }

  @override
  void dispose() {
    emailPhoneController.dispose(); // ✅ avoid memory leaks
    otpController.dispose(); // ✅ avoid memory leaks
    super.dispose();
  }
}
