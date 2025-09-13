import 'package:flutter/material.dart';

import 'package:relive_app/utils/app_files_imports.dart';

class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  final double? toolbarHeight;
  final Widget? title;
  final Color? backgroundColor;
  final bool centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double elevation;
  final IconThemeData? iconTheme;

  const AppBarHeader({
    super.key,
    this.toolbarHeight,
    this.title,
    this.backgroundColor,
    this.centerTitle = true,
    this.actions,
    this.bottom,
    this.elevation = 0,
    this.iconTheme,
  });

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? 65.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      toolbarHeight: toolbarHeight ?? 65.h,
      title:
          title ??
          AppImage(
            imagePath: AppAssets.appIconWithText,
            height: 40,
            width: 150,
          ),
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      centerTitle: centerTitle,
      actions: [SizedBox.shrink()],
      bottom: bottom,
      automaticallyImplyLeading: false,
      elevation: elevation,
      iconTheme: iconTheme ?? const IconThemeData(color: Colors.black),
    );
  }
}

class AppBarContent extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final Widget? backIcon;
  final VoidCallback? onBackTap;
  final bool visible;
  final bool? hideBackButton;

  const AppBarContent({
    super.key,
    required this.title,
    this.textStyle,
    this.backIcon,
    this.onBackTap,
    this.visible = true,
    this.hideBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          Flexible(
            child: AppText(
              title,
              maxLines: 2,
              style: textStyle ?? TextStyle(fontSize: 24).poppinsSemiBold,
              textAlign: TextAlign.center,
            ),
          ),

          Visibility(
            visible: !(hideBackButton ?? false),
            child: AppGestures(
              onTap: onBackTap ?? () => Navigator.pop(context),
              child:
                  backIcon ??
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ), // space to balance layout
        ],
      ),
    );
  }
}
