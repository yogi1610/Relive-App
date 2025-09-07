import 'package:flutter/material.dart';

import 'app_files_imports.dart';

class WeeklyDatePicker extends StatefulWidget {
  const WeeklyDatePicker({super.key});

  @override
  State<WeeklyDatePicker> createState() => _WeeklyDatePickerState();
}

class _WeeklyDatePickerState extends State<WeeklyDatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    DateTime today = DateTime.now();
    DateTime startDate = today.subtract(const Duration(days: 3));
    DateTime endDate = today.add(const Duration(days: 3));

    int totalDays = endDate.difference(startDate).inDays + 1;

    return Row(
      children: List.generate(totalDays, (index) {
        DateTime currentDate = startDate.add(Duration(days: index));
        bool isSelected = currentDate.day == selectedDate.day &&
            currentDate.month == selectedDate.month &&
            currentDate.year == selectedDate.year;

        String formattedDay = DateFormat("d").format(currentDate);
        String formattedFull =
        currentDate.day == today.day &&
            currentDate.month == today.month &&
            currentDate.year == today.year
            ? "Today, ${DateFormat('d MMM').format(currentDate)}"
            : DateFormat("EEE, d MMM").format(currentDate);

        return isSelected
            ? Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: AppGestures(
            onTap: () => setState(() => selectedDate = currentDate),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: theme.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                formattedFull,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.onSurface,
                ).poppinsMedium,
              ),
            ),
          ),
        )
            : Expanded(
          child: AppGestures(
            onTap: () => setState(() => selectedDate = currentDate),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              alignment: Alignment.center,
              child: Text(
                formattedDay,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsMedium,
              ),
            ),
          ),
        );
      }),
    );

  }
}
