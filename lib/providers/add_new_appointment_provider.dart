import 'package:flutter/material.dart';

import '../utils/app_files_imports.dart';

class AddNewAppointmentProvider extends ChangeNotifier {
  /// =========== for selection of practitioner ===========

  TextEditingController notesController = TextEditingController();
  String? _selectedDate;

  String? get selectedDate => _selectedDate;

  String? _selectedTime;

  String? get selectedTime => _selectedTime;

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
      _selectedDate = AppDateOrTimeFormat.formatToYYYYMMDD(
        selectedDate.toString(),
      );
      notifyListeners();
    }
  }

  Future<void> initDataForEditAppointment(AppointmentList appointment) async {
    _selectedTime = appointment.startTime;
    _selectedDate = AppDateOrTimeFormat.formatToYYYYMMDD(appointment.appointmentDate.toString());
    _selectedAppointmentType = getSelectedAppointmentType(
      appointment.appointmentType,
    );
    notesController.text = appointment.notes ?? '';
    notifyListeners();
  }

  void onTapSelectTime(BuildContext context) async {
    _selectedTime = await AppDateOrTimePicker.showTime(context) ?? '';
    notifyListeners();
  }

  void onTapCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<bool> addNewAppointmentApi({
    required BuildContext context,
    bool? isEditingAppointment,
    String? appointmentId,
  }) async {
    // Validation
    if (_selectedDate == null || _selectedDate!.isEmpty) {
      AppMessage.warning("Please select appointment date");
      return false;
    }
    if (_selectedTime == null || _selectedTime!.isEmpty) {
      AppMessage.warning("Please select appointment time");
      return false;
    }
    if (selectedAppointmentType.isEmpty) {
      AppMessage.warning("Please select appointment type");
      return false;
    }

    AppUtils.progressLoadingDialog(context, true);

    Map<String, String> body = {};
    if (isEditingAppointment == true) {
      body[ApiKeys.id] = appointmentId ?? '';
    }
    body[ApiKeys.doctorId] =
        await AppStorageManager.readData(AppKeys.doctorId) ?? '';
    body[ApiKeys.appointmentDate] = _selectedDate ?? '';
    body[ApiKeys.startTime] = _selectedTime ?? '';
    if (notesController.text.isNotEmpty) {
      body[ApiKeys.notes] = notesController.text;
    }
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
        if (isEditingAppointment == true) {
          /// Taking back to last screen when doing edit appointment
          Navigator.of(context).pop(true);
        } else {
          _onAppointmentCreateSuccess(
            context,
            jsonResponse[AppConstants.apiMessage],
          );
        }
      }
      if (context.mounted) {
        await loadLatestAppointments(context);
      }
      return true;
    } else {
      AppMessage.error(jsonResponse[AppConstants.apiMessage]);
      return false;
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

  Future<void> loadLatestAppointments(BuildContext context) async {
    try {
      // 🔹 Refresh AppointmentProvider data
      final appointmentProvider = Provider.of<AppointmentProvider>(
        context,
        listen: false,
      );
      await appointmentProvider.getAllAppointmentsApi(
        context: context,
        page: 1,
      );
    } catch (e) {
      debugPrint('loadLatestAppointments EXCEPTION ------- $e');
      return;
    }
  }

  clearData() {
    _selectedTime = null;
    _selectedDate = null;
    notesController.clear();
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

  String getSelectedAppointmentType(String value) {
    if (value == AppointmentType.consultation.name) {
      return 'Consultation';
    } else if (value == AppointmentType.injection.name) {
      return 'Injection';
    } else if (value == AppointmentType.followup.name) {
      return 'Follow-up';
    } else {
      return 'Consultation';
    }
  }
}

enum AppointmentType { consultation, injection, followup }
