import 'package:flutter/material.dart';

class AppDatePicker {
  static Future<DateTime?> show(
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
}

