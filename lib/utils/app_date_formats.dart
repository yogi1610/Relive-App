import 'package:intl/intl.dart';

class AppDateFormat {
  static String formatToYYYYMMDD(String? dateString) {
    try {
      if (dateString == null || dateString.isEmpty) return "";
      DateTime date = DateTime.parse(dateString);
      return DateFormat('yyyy-MM-dd').format(date);
    } catch (e) {
      return "";
    }
  }
}
