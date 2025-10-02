
import 'package:flutter/material.dart';

class NumberPickerCustom extends StatefulWidget {
  final int initialValue;
  final Function(int) onValueChanged;

  const NumberPickerCustom({
    super.key,
    this.initialValue = 7,
    required this.onValueChanged,
  });

  @override
  State<NumberPickerCustom> createState() => _NumberPickerCustomState();
}

class _NumberPickerCustomState extends State<NumberPickerCustom> {
  late int selectedValue;
  late FixedExtentScrollController controller;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    controller = FixedExtentScrollController(initialItem: selectedValue - 1);
  }

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
        height: MediaQuery.of(context).size.height * 0.42,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Glow/Highlight box behind center item
            Container(
              height: 80,
              width: 190,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(100),
              ),
            ),

            ListWheelScrollView.useDelegate(
              controller: controller,
              itemExtent: 80,
              perspective: 0.002,
              diameterRatio: 3.0,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedValue = index + 1;
                });
                widget.onValueChanged(selectedValue); // Send value to parent
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
                      color: theme.primary,
                      height: 1,
                    ).copyWith(fontWeight: FontWeight.bold);
                  } else if (diff == 1) {
                    style = TextStyle(
                      fontSize: 42,
                      height: 1,
                      color: Color(0xFFC0C0C0),
                    ).copyWith(fontWeight: FontWeight.bold);
                  } else {
                    style = TextStyle(
                      fontSize: 24,
                      height: 1,
                      color: Color(0xFFE5E5E5),
                    ).copyWith(fontWeight: FontWeight.bold);
                  }

                  return Align(
                    alignment: Alignment.center,
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
