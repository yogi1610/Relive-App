
import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class NumberPickerCustom extends StatefulWidget {
  const NumberPickerCustom({super.key});

  @override
  State<NumberPickerCustom> createState() => _NumberPickerCustomState();
}

class _NumberPickerCustomState extends State<NumberPickerCustom> {
  int selectedValue = 7;
  FixedExtentScrollController controller = FixedExtentScrollController(
    initialItem: 6,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: theme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.outlineVariant, width: 1),
        ),
        height: 360.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Glow/Highlight box behind center item
            Container(
              height: 80.h,
              width: 190.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(100),
              ),
            ),

            ListWheelScrollView.useDelegate(
              controller: controller,
              itemExtent: 80,
              // font 65 ke liye enough jagah
              perspective: 0.002,
              diameterRatio: 3.0,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedValue = index + 1;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  if (index < 0 || index > 9) return null;
                  int number = index + 1;

                  int diff = (number - selectedValue).abs();

                  TextStyle style;

                  if (diff == 0) {
                    style = TextStyle(
                      fontSize: 58,
                      color: Theme.of(context).colorScheme.primary,
                      height: 1,
                    ).poppinsBold;
                  } else if (diff == 1) {
                    style = TextStyle(
                      fontSize: 42,
                      height: 1,
                      color: Color(0xFFC0C0C0),
                    ).poppinsBold;
                  } else {
                    style = TextStyle(
                      fontSize: 24,
                      height: 1,
                      color: Color(0xFFE5E5E5),
                    ).poppinsBold;
                  }

                  return Align(
                    alignment: Alignment.center,
                    // 👈 ensures perfect vertical center
                    child: Text(
                      number.toString().padLeft(2, '0'),
                      textAlign: TextAlign.center,
                      style: style,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}