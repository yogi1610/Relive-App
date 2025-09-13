import 'package:flutter/cupertino.dart';

import '../utils/app_files_imports.dart';

class AppointmentProvider extends ChangeNotifier {
  String? _selectedDate;

  String? get selectedDate => _selectedDate;

  void onTapSelectDate(BuildContext context) async {
    DateTime? selectedDate = await AppDatePicker.show(
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
}
