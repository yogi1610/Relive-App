import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class DrawerNotificationScreen extends StatefulWidget {
  const DrawerNotificationScreen({super.key});

  @override
  State<DrawerNotificationScreen> createState() =>
      _DrawerNotificationScreenState();
}

class _DrawerNotificationScreenState extends State<DrawerNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.notification,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          spacing: 15,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: TextFormField(
                textAlign: TextAlign.right,
                decoration: InputDecoration().suffixIconTextField(
                  suffix: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: AppImage(
                      imagePath: 'assets/images/svg/ic_search_icon.svg',
                    ),
                  ),
                  hintText: AppString.search,
                  context: context,
                ),
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              },
              itemCount: 10,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText(
                            '3h',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.onSecondaryFixedVariant,
                            ).poppinsRegular,
                          ),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Color(0xFF2FADB7),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: AppText(
                          (index % 2) == 0
                              ? 'Your pain score improved by 15% this week!'
                              : 'Reminder: Appointment with Dr. Smith in 1 hour.',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16).poppinsRegular,
                        ),
                      ),
                    ),

                    Container(
                      height: 50.h,
                      width: 50.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: theme.primary.withValues(alpha: 0.25),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.notifications_none_rounded,
                        size: 30,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
