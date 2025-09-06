import 'package:flutter/material.dart';
import 'package:relive_app/services/navigation_services/curve_list.dart';
import '../../utils/app_files_imports.dart';

class CustomNavigator {
  static void pushReplacementNavigate(BuildContext context, var page) {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        pageBuilder: (context, animation, anotherAnimation) {
          return page;
        },
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, anotherAnimation, child) {
          animation = CurvedAnimation(curve: curveList[4], parent: animation);
          return SlideTransition(
            position: Tween(
                begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                .animate(animation),
            child: child,
          );
        }));
  }

  static void pushNavigateWithZeroTransition({
    required BuildContext context,
    required Widget page,
    Function? hitApi,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, _, _) => page,
        transitionDuration: const Duration(seconds: 0),
      ),
    ).then(
          (value) {
        if (value != null && hitApi != null) {
          hitApi(
            value,
          );
        }
      },
    );
  }

  static void pushAndRemoveUntilWithZeroTransition(BuildContext context, var page) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (_, _, _) => page,
          transitionDuration: const Duration(seconds: 0),
        ),
            (route) => false);
  }

  static void pushAndRemoveUntill(BuildContext context, var page) {
    if (kIsWeb) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => page), (route) => false);
    } else if (Platform.isIOS) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => page), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, anotherAnimation) {
                return page;
              },
              transitionDuration: const Duration(milliseconds: 1000),
              transitionsBuilder:
                  (context, animation, anotherAnimation, child) {
                animation =
                    CurvedAnimation(curve: curveList[4], parent: animation);
                return SlideTransition(
                  position: Tween(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0))
                      .animate(animation),
                  child: child,
                );
              }),
              (route) => false);
    }
  }

  static void pushNavigate({
    required BuildContext context,
    required Widget page,
    Function? hitApi,
  }) {
    if (kIsWeb) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => page))
          .then(
            (value) {
          if (value != null && hitApi != null) {
            hitApi(
              value,
            );
          }
        },
      );
    } else if (Platform.isIOS) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => page))
          .then(
            (value) {
          if (value != null && hitApi != null) {
            hitApi(
              value,
            );
          }
        },
      );
    } else {
      Navigator.of(context)
          .push(PageRouteBuilder(
          pageBuilder: (context, animation, anotherAnimation) {
            return page;
          },
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder:
              (context, animation, anotherAnimation, child) {
            animation =
                CurvedAnimation(curve: curveList[4], parent: animation);
            return SlideTransition(
              position: Tween(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0))
                  .animate(animation),
              child: child,
            );
          }))
          .then(
            (value) {
          if (value != null && hitApi != null) {
            hitApi(
              value,
            );
          }
        },
      );
    }
  }
}

class SlideUpPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideUpPageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween =
      Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}