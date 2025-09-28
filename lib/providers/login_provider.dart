import 'package:flutter/cupertino.dart';
import 'package:relive_app/screens/login_otp_verify_screen.dart';
import 'package:relive_app/services/api_services/api_keys.dart';
import '../utils/app_files_imports.dart';

class LoginProvider extends ChangeNotifier {
  /// =============== SEND OTP ==============
  TextEditingController emailPhoneController = TextEditingController();

  final GlobalKey<FormState> _sendOtpFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> get sendOtpFormKey => _sendOtpFormKey;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool isRememberCheck = false;

  void onTapRememberMe(bool? value) {
    isRememberCheck = value!;
    notifyListeners();
  }

  void sendOtp(BuildContext context) {
    if (_sendOtpFormKey.currentState?.validate() ?? false) {
      sendOtpForLoginApi(context: context);
      FocusScope.of(context).unfocus();
    }
  }

  Future<void> sendOtpForLoginApi({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final body = {ApiKeys.email: emailPhoneController.text};

      final jsonResponse = await Apis.sendOtpLogin(body: body);

      if (jsonResponse[AppConstants.apiStatus] == true) {
        AppMessage.success(jsonResponse[AppConstants.apiMessage]);
        if (context.mounted) {
          _onSentOtpSuccess(context);
        }
      } else {
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

      final jsonResponse = await Apis.verifyOtp(body: body);

      if (jsonResponse[AppConstants.apiStatus] == true) {
        AppMessage.success(jsonResponse[AppConstants.apiMessage]);
        if (context.mounted) {
          _onVerifyOtpSuccess(context);
        }
      } else {
        AppMessage.error(jsonResponse[AppConstants.apiMessage]);
      }
    } catch (e) {
      return;
    } finally {
      _isVerifyLoading = false;
      notifyListeners();
    }
  }

  void _onVerifyOtpSuccess(BuildContext context) {
    CustomNavigator.pushNavigate(
      context: context,
      page: LoginChooseYourClinicScreen(),
    );
  }

  @override
  void dispose() {
    emailPhoneController.dispose(); // ✅ avoid memory leaks
    otpController.dispose(); // ✅ avoid memory leaks
    super.dispose();
  }
}
