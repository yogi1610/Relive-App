import 'package:flutter/cupertino.dart';

import '../utils/app_files_imports.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObscure = false;

  bool get isObscure => _isObscure;

  void onTogglePassword() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  bool isRememberCheck = false;

  void onTapRememberMe(bool? value) {
    isRememberCheck = value!;
    notifyListeners();
  }

  void onTapSignIn({required BuildContext context}) {
    CustomNavigator.pushNavigate(
      context: context,
      page: LoginChooseYourClinicScreen(),
    );
  }
}
