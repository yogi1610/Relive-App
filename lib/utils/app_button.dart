import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final Widget? child;
  final double? textSize;
  final double? btnRadius;
  final double? btnWidth;
  final double? btnHeight;
  final Color? buttonColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final bool? isLoading;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.name,
    this.child,
    this.textStyle,
    this.textSize,
    this.padding,
    this.btnRadius,
    this.buttonColor,
    this.borderColor,
    this.btnWidth,
    this.borderRadius,
    this.btnHeight,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth ?? MediaQuery.of(context).size.width,
      height: btnHeight ?? 65.h,
      margin: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: buttonColor ?? Theme.of(context).colorScheme.primary,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 60),
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              disabledForegroundColor: Colors.transparent.withValues(
                alpha: 0.38,
              ),
              disabledBackgroundColor: Colors.transparent.withValues(
                alpha: 0.12,
              ),
              shadowColor: Colors.transparent,
            ),
            onPressed: (isLoading ?? false)
                ? null
                : () {
                    onPressed(); // Trigger the button action
                  },
            child: Visibility(
              visible: isLoading ?? false,
              replacement:
                  child ??
                  AppText(
                    name,
                    textAlign: TextAlign.center,
                    style:
                        textStyle ??
                        TextStyle(
                          fontSize: textSize ?? 22,
                          color: AppColors.colorWhite,
                        ).poppinsMedium,
                  ),
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.surface,
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
