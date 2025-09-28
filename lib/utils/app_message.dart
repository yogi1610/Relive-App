import 'package:flutter/material.dart';
import 'package:relive_app/main.dart';
import 'dart:ui' as ui;
import 'app_files_imports.dart';

class AppMessage {
  static void success(String msg) {
    _showToast(
      msg: msg,
      bgColor: Colors.green,
      icon: Icons.check_circle_rounded,
      iconBgColor: Colors.green.shade700,
    );
  }

  static void error(String msg) {
    _showToast(
      msg: msg,
      bgColor: const Color(0xFFFF7474),
      icon: Icons.error_rounded,
      iconBgColor: Colors.red,
    );
  }

  static void warning(String msg) {
    _showToast(
      msg: msg,
      bgColor: Colors.orange,
      icon: Icons.warning_amber_rounded,
      iconBgColor: Colors.orange.shade700,
    );
  }

  static void info(String msg) {
    _showToast(
      msg: msg,
      bgColor: Colors.blue,
      icon: Icons.info_rounded,
      iconBgColor: Colors.blue.shade700,
    );
  }

  /// Base function
  static void _showToast({
    required String msg,
    required Color bgColor,
    required IconData icon,
    required Color iconBgColor,
  }) {
    toastification.show(
      context: navigatorKey.currentContext!,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      borderSide: BorderSide.none,
      description: Text(
        msg,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ).poppinsMedium,
      ),
      alignment: Alignment.topCenter,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.always,
        buttonBuilder: (context, onClose) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onClose(),
            child: const Icon(Icons.close_rounded, size: 22, color: Colors.white),
          );
        },
      ),
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0, -1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      showIcon: true,
      backgroundColor: bgColor,
      foregroundColor: bgColor,
      primaryColor: bgColor,
      margin: Platform.isIOS
          ? const EdgeInsets.only(top: 5, left: 0, right: 0)
          : const EdgeInsets.only(top: 15, left: 7, right: 7),
      direction: ui.TextDirection.rtl,
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(30),
      showProgressBar: false,
      closeOnClick: false,
      pauseOnHover: false,
      icon: Container(
        height: 35,
        width: 35,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: iconBgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 22, color: Colors.white),
      ),
      dismissDirection: DismissDirection.vertical,
      dragToClose: true,
      applyBlurEffect: false,
    );
  }
}

