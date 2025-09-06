import 'package:flutter/material.dart';

class AppGestures extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final BorderRadius? borderRadius;
  final Color? splashColor;
  final ShapeBorder? shape;
  final double? radius;

  const AppGestures(
      {super.key,
        required this.child,
        required this.onTap,
        this.onDoubleTap,
        this.borderRadius,
        this.onLongPress,
        this.splashColor,
        this.shape,
        this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap();
      },
      child: child,
    );
  }
}