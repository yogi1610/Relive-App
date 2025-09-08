import 'package:flutter/material.dart';

import '../utils/app_files_imports.dart';

class LogoutUserAccountPopup extends StatefulWidget {
  const LogoutUserAccountPopup({super.key});

  @override
  State<LogoutUserAccountPopup> createState() =>
      _DeleteAppointmentDialogueState();
}

class _DeleteAppointmentDialogueState extends State<LogoutUserAccountPopup> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        spacing: 15,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppGestures(
              onTap: () {
                Navigator.pop(context);
              },
              child: AppImage(imagePath: 'assets/images/svg/ic_close_icon.svg'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: AppText(
              AppString.logoutConfirm,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16).poppinsSemiBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              spacing: 15,
              children: [
                Expanded(
                  child: AppButton(
                    btnHeight: 50.h,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    borderColor: theme.primary,
                    buttonColor: theme.surface,
                    name: AppString.no,
                    textStyle: TextStyle(fontSize: 14).poppinsSemiBold,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    name: AppString.yes,
                    buttonColor: theme.primary.withValues(alpha: 0.2),
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: theme.primary,
                    ).poppinsSemiBold,
                    btnHeight: 50.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
