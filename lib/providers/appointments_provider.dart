import 'package:flutter/cupertino.dart';
import '../utils/app_files_imports.dart';

class AppointmentProvider extends ChangeNotifier {
  AppointmentProvider() {
    paginationHelper = PaginationHelper(
      onFetchData: (page) async {
        // Only fetch if we have more pages
        if (totalPage == null || page <= totalPage!) {
          final newItems = await _getAllAppointmentsApi(
            page: page,
            perPage: 10,
          );

          if (newItems.isNotEmpty) {
            paginationHelper.currentPage++; // Next page increment
          }
        }
      },
    )..init();
  }

  List<AppointmentList> appointmentList = [];
  int? totalPage;
  late PaginationHelper paginationHelper;
  String? _selectedDate;

  String? get selectedDate => _selectedDate;

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
      onDateChanged(date: _selectedDate.toString());
    }
  }

  Future<void> onDateChanged({String? date}) async {
    appointmentList.clear();
    paginationHelper.reset();

    // Fetch first page based on search
    final newItems = await _getAllAppointmentsApi(
      page: 1,
      perPage: 10,
      date: date,
    );

    if (newItems.isNotEmpty) {
      appointmentList.addAll(newItems);
      paginationHelper.currentPage = 2;
    }

    notifyListeners();
  }

  // Manual first page load (for WellnessProvider)
  Future<void> getAllAppointmentsApi({
    required BuildContext context,
    int page = 1,
    int perPage = 10,
    String? search,
    String? filter,
  }) async {
    final newItems = await _getAllAppointmentsApi(page: page, perPage: perPage);

    if (page == 1) appointmentList.clear();

    appointmentList.addAll(newItems);

    // Update pagination helper info
    if (totalPage != null) {
      paginationHelper.updateHasMoreData(page < totalPage!);
      paginationHelper.currentPage = page + 1; // Next page
    }
    debugPrint('appointmentList---${appointmentList.length}');
    notifyListeners();
  }

  Future<List<AppointmentList>> _getAllAppointmentsApi({
    required int page,
    required int perPage,
    String? date,
  }) async {
    final String formattedDate =
        date ?? DateFormat('yyyy-MM-dd').format(DateTime.now());
    Map<String, String> body = {
      ApiKeys.page: page.toString(),
      ApiKeys.perPage: perPage.toString(),
      ApiKeys.date: formattedDate,
    };
    final response = await Apis.getDailyAppointments(body: body);

    if (response != null && response.status) {
      final newItems = response.data.appointments;
      if (page != 1) appointmentList.addAll(newItems);
      totalPage = response.data.totalPages ?? 0; // int, never null
      paginationHelper.updateHasMoreData(page < (totalPage ?? 0));

      notifyListeners();
      return newItems;
    } else {
      paginationHelper.updateHasMoreData(false);
      return [];
    }
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
      removeAppointmentOnDelete(appointmentId);
      AppMessage.success(jsonResponse[AppConstants.apiMessage]);
      if (context.mounted) {
        Navigator.of(context).pop(true);
      }
    } else {
      AppMessage.error(jsonResponse[AppConstants.apiMessage]);
    }
  }

  void removeAppointmentOnDelete(String id) {
    appointmentList.removeWhere((data) => data.id.toString() == id.toString());
    notifyListeners();
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
