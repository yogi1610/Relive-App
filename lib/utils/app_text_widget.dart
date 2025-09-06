import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final StrutStyle? strutStyle;
  final bool? selectable;

  const AppText(
      this.text, {
        super.key,
        this.style,
        this.textAlign,
        this.overflow,
        this.maxLines,
        this.textWidthBasis,
        this.textHeightBehavior,
        this.strutStyle,
        this.selectable = false,
      });

  @override
  Widget build(BuildContext context) {
    final translatedText = text.tr();

    if (selectable == true) {
      return SelectableText(
        translatedText,
        style: style,
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );
    }

    return Text(
      translatedText,
      style: style,
      textAlign: textAlign ?? TextAlign.center,
      overflow: overflow,
      maxLines: maxLines,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      strutStyle: strutStyle,
    );
  }
}
