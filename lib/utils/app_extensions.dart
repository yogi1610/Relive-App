import 'package:flutter/material.dart';

import 'app_files_imports.dart';

extension Number on num {
  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * (this / 100);
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * (this / 100);
  }

  Widget get verticalSizeBox {
    return SizedBox(height: toDouble());
  }

  Widget get horizontalSizeBox {
    return SizedBox(width: toDouble());
  }
}

extension InputDec on InputDecoration {
  InputDecoration passwordTxtFieldStyle({
    required bool obscured,
    required BuildContext context,
    Color? color,
    Color? borderColor,
    Widget? prefixIcon,
    Widget? suffixChild,
    required VoidCallback toggleObscured,
    Color? backgroundColor,
    EdgeInsets? contentPadding,
    required String hintText,
    double? borderRadius,
  }) => InputDecoration(
    hintText: hintText.tr(),
    hintStyle: TextStyle(
      fontSize: 14,
      color: Theme.of(context).colorScheme.onSecondaryFixed,
    ).poppinsRegular,
    errorStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.colorRed,
    ).poppinsRegular,
    suffixIcon: Padding(
      padding: const EdgeInsets.all(13.0),
      child: Icon(Icons.lock_sharp, color: Color(0xFFDADADA)),
    ),
    prefixIcon: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppGestures(
          onTap: toggleObscured,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: obscured
                ? AppImage(imagePath: 'assets/images/svg/ic_eye_close.svg')
                : AppImage(imagePath: 'assets/images/svg/ic_eye_open.svg'),
          ),
        ),
        suffixChild ?? const SizedBox.shrink(),
      ],
    ),
    contentPadding:
        contentPadding ??
        const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: const BorderSide(color: AppColors.colorRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: const BorderSide(color: AppColors.colorRed),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.primary,
      ),
    ),
    filled: true,
    fillColor: Theme.of(context).colorScheme.surface,
  );

  InputDecoration prefixIconTextField({
    Widget? prefixIcon,
    required BuildContext context,
    Color? backgroundColor,
    EdgeInsets? contentPadding,
    required String hintText,
    Color? borderColor,
    double? borderRadius,
  }) => InputDecoration(
    hintText: hintText.tr(),
    alignLabelWithHint: true,
    prefixIcon: prefixIcon ?? SizedBox.shrink(),
    hintStyle: TextStyle(
      fontSize: 14,
      color: Theme.of(context).colorScheme.onSecondaryFixed,
    ).poppinsRegular,
    errorStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.colorRed,
    ).poppinsRegular,
    contentPadding:
        contentPadding ??
        const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: const BorderSide(color: AppColors.colorRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: const BorderSide(color: AppColors.colorRed),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.primary,
      ),
    ),
    filled: true,
    fillColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
  );

  InputDecoration suffixIconTextField({
    required Widget suffix,
    required String hintText,
    Widget? prefixIcon,
    EdgeInsets? contentPadding,
    Color? borderColor,
    double? borderRadius,
    Color? backgroundColor,
    required BuildContext context,
  }) => InputDecoration(
    suffixIcon: suffix,
    alignLabelWithHint: true,
    hintText: hintText.tr(),
    prefixIcon: prefixIcon,
    hintStyle: TextStyle(
      fontSize: 14,
      color: Theme.of(context).colorScheme.onSecondaryFixed,
    ).poppinsRegular,
    errorStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.colorRed,
    ).poppinsRegular,
    contentPadding:
        contentPadding ??
        const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: const BorderSide(color: AppColors.colorRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: const BorderSide(color: AppColors.colorRed),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.primary,
      ),
    ),
    filled: true,
    fillColor: Theme.of(context).colorScheme.surface,
  );

  InputDecoration defaultTextField({
    required String hintText,
    Widget? prefixIcon,
    EdgeInsets? contentPadding,
    Color? borderColor,
    double? borderRadius,
    Color? backgroundColor,
    required BuildContext context,
  }) => InputDecoration(
    hintText: hintText.tr(),
    alignLabelWithHint: true,
    hintStyle: TextStyle(
      fontSize: 14,
      color: Theme.of(context).colorScheme.onSecondaryFixed,
    ).poppinsRegular,
    errorStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.colorRed,
    ).poppinsRegular,
    contentPadding:
        contentPadding ??
        const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: const BorderSide(color: AppColors.colorRed),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: const BorderSide(color: AppColors.colorRed),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.outline,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      borderSide: BorderSide(
        color: borderColor ?? Theme.of(context).colorScheme.primary,
      ),
    ),
    filled: true,
    fillColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
  );
}
