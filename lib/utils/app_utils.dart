import 'package:flutter/material.dart';


class AppUtils {
  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  static progressLoadingDialog(BuildContext context, bool status) {
    if (status) {
      showDialog(
        context: context,
        barrierDismissible: false,
          useRootNavigator: true,
        builder: (BuildContext context) {
          return Center(child: Image.asset('assets/images/png/gif_loader.gif'));
        },
      );
    } else {
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }
}
