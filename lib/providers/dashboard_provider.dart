import 'package:flutter/cupertino.dart';

class DashboardProvider extends ChangeNotifier {
  int _selectedPage = 0;
  int get selectedPage => _selectedPage;

  List<NavigationBarModel> navigationItems = [
    NavigationBarModel(
      icon: 'assets/images/svg/ic_bnb_home.svg',
      label: 'home',
      page: Container(),
    ),
    NavigationBarModel(
      icon: 'assets/images/svg/ic_bnb_meetings.svg',
      label: 'meeting',
      page: Container(),
    ),
    NavigationBarModel(
      icon: 'assets/images/svg/ic_bnb_progress_report.svg',
      label: 'progress tracking',
      page: Container(),
    ),
    NavigationBarModel(
      icon: 'assets/images/svg/ic_bnb_settings_profile.svg',
      label: 'settings',
      page: Container(),
    ),
  ];

  void onNavBarItemTap(int index) {
    _selectedPage = index;
    notifyListeners();
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
