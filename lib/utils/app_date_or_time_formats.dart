import 'package:intl/intl.dart';

class AppDateOrTimeFormat {
  static String formatToYYYYMMDD(String? dateString) {
    try {
      if (dateString == null || dateString.isEmpty) return "";
      DateTime date = DateTime.parse(dateString);
      return DateFormat('yyyy-MM-dd').format(date);
    } catch (e) {
      return "";
    }
  }
  static String formatToMMDDYY(String? dateString) {
    try {
      if (dateString == null || dateString.isEmpty) return "";
      DateTime date = DateTime.parse(dateString);
      return DateFormat('MM/dd/yyyy').format(date);
    } catch (e) {
      return "";
    }
  }


  static String formatToHumanReadable(dynamic date) {
    try {
      if (date == null) return "";

      DateTime dt;

      if (date is String) {
        dt = DateTime.parse(date); // parse ISO string
      } else if (date is DateTime) {
        dt = date;
      } else {
        return "";
      }

      return DateFormat("MMMM d, yyyy").format(dt);
    } catch (e) {
      return "";
    }
  }

  static String formatTime12Hour(String time24) {
    try {
      final dateTime = DateFormat("HH:mm:ss").parse(time24);
      return DateFormat("hh:mm a").format(dateTime).toUpperCase();
    } catch (e) {
      // Agar invalid format aaye to original return kar de
      return time24;
    }
  }
}
