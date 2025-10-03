import 'package:flutter/material.dart';

import '../utils/app_files_imports.dart';

class AddNewAppointmentProvider extends ChangeNotifier {
  /// =========== for selection of practitioner ===========

  String? _selectedDate;

  String? get selectedDate => _selectedDate;

  String? _selectedTime;

  String? get selectedTime => _selectedTime;

  List<String> practitionerList = [
    'Dr. Wilson',
    'Dr. Alex',
    'Dr. Lois',
    'Dr. Simran',
    'Dr. Divya',
  ];

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

  void onTapSelectDate(BuildContext context) async {
    DateTime? selectedDate = await AppDateOrTimePicker.showDate(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null) {
      _selectedDate = AppDateFormat.formatToYYYYMMDD(selectedDate.toString());
      notifyListeners();
    }
  }

  void onTapSelectTime(BuildContext context) async {
    _selectedTime = await AppDateOrTimePicker.showTime(context) ?? '';
    notifyListeners();
  }

  void onTapCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> addNewAppointmentApi({required BuildContext context}) async {
    // Validation
    if (_selectedDate == null || _selectedDate!.isEmpty) {
      AppMessage.warning("Please select appointment date");
      return;
    }
    if (_selectedTime == null || _selectedTime!.isEmpty) {
      AppMessage.warning("Please select appointment time");
      return;
    }
    if (selectedAppointmentType.isEmpty) {
      AppMessage.warning("Please select appointment type");
      return;
    }

    AppUtils.progressLoadingDialog(context, true);

    Map<String, String> body = {};
    body[ApiKeys.doctorId] =
        await AppStorageManager.readData(AppKeys.doctorId) ?? '';
    body[ApiKeys.appointmentDate] = _selectedDate ?? '';
    body[ApiKeys.startTime] = _selectedTime ?? '';
    body[ApiKeys.appointmentType] = finalAppointmentType(
      selectedAppointmentType,
    );

    var jsonResponse = await Apis.createOrUpdateAppointment(body: body);

    if (context.mounted) {
      AppUtils.progressLoadingDialog(context, false);
    }

    if (jsonResponse[AppConstants.apiStatus] == true) {
      clearData();
      if (context.mounted) {
        _onAppointmentCreateSuccess(
          context,
          jsonResponse[AppConstants.apiMessage],
        );
      }
    } else {
      AppMessage.error(jsonResponse[AppConstants.apiMessage]);
    }
  }

  void _onAppointmentCreateSuccess(BuildContext context, String message) {
    if (context.mounted) {
      ShowPopUp.dialogueBox(
        context: context,
        body: AppointmentSuccessDialogue(successMessage: message),
      );
    }
  }

  clearData() {
    _selectedTime = null;
    _selectedDate = null;
    notifyListeners();
  }

  String finalAppointmentType(String value) {
    if (value == 'Consultation') {
      return AppointmentType.consultation.name;
    } else if (value == 'Injection') {
      return AppointmentType.injection.name;
    } else if (value == 'Follow-up') {
      return AppointmentType.followup.name;
    } else {
      return AppointmentType.consultation.name;
    }
  }
}

enum AppointmentType { consultation, injection, followup }
