import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ShowPopUp {
  static void dialogueBox({
    required BuildContext context,
    required Widget body,
    bool? barrierDismissible,
    Function? callApi,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible ?? true,
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(7),
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: DrawerBackground(child: body),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        callApi!(value);
      }
    });
  }

  static void bottomSheet({
    required BuildContext context,
    required Widget body,
    bool? barrierDismissible,
    Function? callApi,
  }) {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: barrierDismissible ?? true,
      duration: const Duration(milliseconds: 150),
      builder: (BuildContext context) {
        return Padding(padding: MediaQuery.of(context).viewInsets, child: body);
      },
    ).then((value) {
      if (value != null) {
        callApi!(value);
      }
    });
  }
}

class DrawerBackground extends StatelessWidget {
  final Widget child;
  final bool? hideDrawer;
  final double? maxHeight;
  final Widget? bottomNavigationBar;

  const DrawerBackground({
    super.key,
    required this.child,
    this.hideDrawer,
    this.maxHeight,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [child]),
    );
  }
}
