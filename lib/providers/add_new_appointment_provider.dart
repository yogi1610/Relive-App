import '../utils/app_files_imports.dart';

import 'package:flutter/foundation.dart';

class AddNewAppointmentProvider extends ChangeNotifier {
  /// =========== for selection of practitioner ===========
  bool _isPractitionerDropdownOpen = false;

  bool get isPractitionerDropdownOpen => _isPractitionerDropdownOpen;

  String _selectedPractitioner = 'Dr. Wilson';

  String get selectedPractitioner => _selectedPractitioner;

  List<String> practitionerList = [
    'Dr. Wilson',
    'Dr. Alex',
    'Dr. Lois',
    'Dr. Simran',
    'Dr. Divya',
  ];

  void onTapPractitionerItem(int index) {
    _selectedPractitioner = practitionerList[index];
    _isPractitionerDropdownOpen = false;
    notifyListeners();
  }

  void onTapPractitioner() {
    _isPractitionerDropdownOpen = true;
    notifyListeners();
  }

  /// =========== for selection of Appointment type ===========
  bool _isAppointmentTypeDropdownOpen = false;

  bool get isAppointmentTypeDropdownOpen => _isAppointmentTypeDropdownOpen;

  String _selectedAppointmentType = 'Consultation';

  String get selectedAppointmentType => _selectedAppointmentType;

  List<String> appointmentTypeList = ['Consultation', 'Injection', 'Follow-up'];

  void onTapAppointmentTypeItem(int index) {
    _selectedAppointmentType = appointmentTypeList[index];
    _isAppointmentTypeDropdownOpen = false;
    notifyListeners();
  }

  void onTapAppointmentType() {
    _isAppointmentTypeDropdownOpen = true;
    notifyListeners();
  }
}
