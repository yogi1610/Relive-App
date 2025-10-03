import 'package:flutter/material.dart';
import '../utils/app_files_imports.dart';

class DashboardProvider extends ChangeNotifier {
  /// ============= PATIENT INFO ==============

  String _userName = '';

  String get userName => _userName;

  String _userEmail = '';

  String get userEmail => _userEmail;

  String _userImage = '';

  String get userImage => _userImage;

  String userPhone = '';
  String countryCode = '';

  Future<void> updateUserData({
    required String name,
    required String email,
    String? image,
  }) async {
    _userName = name;
    _userEmail = email;
    if (image != null) {
      _userImage = image;
    }
    notifyListeners();
  }

  Future<void> patientInfoApi() async {
    final response = await Apis.patientInfo(body: {});
    if (response != null && response.status) {
      await updateUserData(
        name: response.patient.name,
        email: response.patient.email,
        image: response.patient.image,
      );
      userPhone = response.patient.phone;
      countryCode = response.patient.countryCode;
      await saveValues(response);
      notifyListeners();
    } else {}
  }

  Future<void> saveValues(PatientInfoResponse response) async {
    AppStorageManager.saveData(
      AppKeys.doctorId,
      response.patient.doctor.id.toString(),
    );
    AppStorageManager.saveData(
      AppKeys.clinicId,
      response.patient.clinic.id.toString(),
    );
  }

  /// ============ BOTTOM NAVIGATION BAR ===========

  int _selectedPage = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  int get selectedPage => _selectedPage;

  List<NavigationBarModel> navigationItems = [
    NavigationBarModel(
      icon: 'assets/images/svg/ic_bnb_home.svg',
      label: 'home',
      page: HomeScreen(),
    ),
    NavigationBarModel(
      icon: 'assets/images/svg/ic_bnb_meetings.svg',
      label: 'meeting',
      page: AppointmentScreen(),
    ),
    NavigationBarModel(
      icon: 'assets/images/svg/ic_bnb_progress_report.svg',
      label: 'progress tracking',
      page: ProgressReportScreen(),
    ),
    NavigationBarModel(
      icon: 'assets/images/svg/ic_bnb_settings_profile.svg',
      label: 'settings',
      page: Container(),
    ),
  ];

  void onNavBarItemTap(int index, [bool notify = true]) {
    if (index == 3) {
      // just open drawer without changing selected page
      _scaffoldKey.currentState!.openEndDrawer();
      return; // stop here
    }

    _selectedPage = index;
    if (notify) notifyListeners();
  }

  /// =============== LOGOUT USER ===============

  Future<void> logoutApi(BuildContext context) async {
    AppUtils.progressLoadingDialog(context, true);
    Map<String, String> body = {};
    body['device_id'] = 'xx123'; // need to make it dynamic
    var jsonResponse = await Apis.logout(body: body);
    if (context.mounted) {
      AppUtils.progressLoadingDialog(context, false);
    }
    if (jsonResponse[AppConstants.apiStatus]) {
      await userLogout();
      AppMessage.success(jsonResponse[AppConstants.apiMessage]);
      if (context.mounted) _onLogOutSuccess(context);
    } else {
      AppMessage.error(jsonResponse[AppConstants.apiMessage]);
    }
    notifyListeners();
  }

  void _onLogOutSuccess(BuildContext context) {
    CustomNavigator.pushAndRemoveUntilWithZeroTransition(
      context,
      LoginScreen(),
    );
  }

  Future<void> userLogout() async {
    AppStorageManager.saveData(AppKeys.isUserLogin, false);
    AppStorageManager.deleteData(AppKeys.clinicId);
    AppStorageManager.deleteData(AppKeys.userId);
  }
}

class NavigationBarModel {
  String icon;
  String label;
  Widget page;

  NavigationBarModel({
    required this.icon,
    required this.label,
    required this.page,
  });
}
