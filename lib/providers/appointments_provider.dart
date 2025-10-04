import 'package:flutter/cupertino.dart';

import '../utils/app_files_imports.dart';

class AppointmentProvider extends ChangeNotifier {
  AppointmentProvider() {
    getAppointmentsApi();
  }

  String? _selectedDate;

  String? get selectedDate => _selectedDate;

  void onTapSelectDate(BuildContext context) async {
    DateTime? selectedDate = await AppDateOrTimePicker.showDate(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null) {
      _selectedDate = AppDateFormat.formatToYYYYMMDD(selectedDate.toString());
      notifyListeners();
    }
  }

  Future<void> getAppointmentsApi() async {
    await Apis.getDailyAppointments(body: {});
  }

  Future<void> deleteAppointmentApi({
    required BuildContext context,
    required String appointmentId,
  }) async {
    AppUtils.progressLoadingDialog(context, true);
    Map<String, String> body = {};
    body[ApiKeys.id] = appointmentId;
    var jsonResponse = await Apis.deleteAppointment(body: body);
    if (context.mounted) {
      AppUtils.progressLoadingDialog(context, false);
    }
    if (jsonResponse[AppConstants.apiStatus] == true) {
      AppMessage.success(jsonResponse[AppConstants.apiMessage]);
      if (context.mounted) {
        Navigator.of(context).pop(true);
      }
    } else {
      AppMessage.error(jsonResponse[AppConstants.apiMessage]);
    }
  }

  void onTapAppointmentDelete({
    required BuildContext context,
    required String appointmentId,
  }) {
    ShowPopUp.dialogueBox(
      context: context,
      body: DeleteAppointmentDialogue(),
      callApi: (val) {
        if (val == true) {
          deleteAppointmentApi(context: context, appointmentId: appointmentId);
        }
      },
    );
  }
}
