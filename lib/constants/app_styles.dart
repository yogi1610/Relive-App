import 'package:flutter/material.dart';
import '../utils/app_files_imports.dart';

extension AppTextStyles on TextStyle {
  TextStyle get poppinsLight =>
      copyWith(fontFamily: AppFonts.poppinsLight).responsive;

  TextStyle get poppinsRegular =>
      copyWith(fontFamily: AppFonts.poppinsRegular).responsive;

  TextStyle get poppinsMedium =>
      copyWith(fontFamily: AppFonts.poppinsMedium).responsive;

  TextStyle get poppinsSemiBold =>
      copyWith(fontFamily: AppFonts.poppinsSemiBold).responsive;

  TextStyle get poppinsBold =>
      copyWith(fontFamily: AppFonts.poppinsBold).responsive;
}

extension ResponsiveTextStyle on TextStyle {
  TextStyle get responsive {
    return copyWith(
      fontSize: (fontSize ?? 14).sp, // default 14
    );
  }
}
