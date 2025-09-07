import 'package:flutter/cupertino.dart';

class MedicalPlanProvider extends ChangeNotifier {
  bool _isStatusDropdownOpen = false;

  bool get isStatusDropdownOpen => _isStatusDropdownOpen;

  String _selectedStatus = 'All';

  String get selectedStatus => _selectedStatus;

  List<String> statusList = [
    'All',
    'Skipped',
    'Pending',
    'Upcoming',
    'Completed',
  ];

  void onTapUnitItem(int index) {
    _selectedStatus = statusList[index];
    _isStatusDropdownOpen = false;
    notifyListeners();
  }

  void onTapUnit() {
    _isStatusDropdownOpen = true;
    notifyListeners();
  }
}
