import 'package:flutter/material.dart';
import 'package:relive_app/screens/appointment_screen.dart';
import 'package:relive_app/screens/home_screen.dart';
import 'package:relive_app/screens/progress_tracking_screen.dart';

class DashboardProvider extends ChangeNotifier {
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
      page: ProgressTrackingScreen(),
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
