import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateOrTimePicker {
  static Future<DateTime?> showDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        final theme = Theme.of(context);

        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: theme.colorScheme.primary,
              onPrimary: theme.colorScheme.onPrimary,
              onSurface: theme.colorScheme.onSurface,
            ),
            textTheme: theme.textTheme.copyWith(
              bodyLarge: theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
              bodyMedium: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
              bodySmall: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked == null) return null;

    return DateTime(picked.year, picked.month, picked.day);
  }

  static Future<String?> showTime(
    BuildContext context, {
    TimeOfDay? initialTime,
  }) async {
    final TimeOfDay now = TimeOfDay.now();

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime ?? now,
      builder: (context, child) {
        final theme = Theme.of(context);
        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: theme.colorScheme.primary,
              onPrimary: theme.colorScheme.onPrimary,
              onSurface: theme.colorScheme.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked == null) return null;

    // Convert TimeOfDay -> DateTime
    final nowDate = DateTime.now();
    final dateTime = DateTime(
      nowDate.year,
      nowDate.month,
      nowDate.day,
      picked.hour,
      picked.minute,
    );

    // Format to HH:mm:ss
    return DateFormat('HH:mm:ss').format(dateTime);
  }
}
