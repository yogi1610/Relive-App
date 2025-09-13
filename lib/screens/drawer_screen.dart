import 'package:flutter/material.dart';

import 'package:relive_app/utils/app_files_imports.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int? currentIndex;

  List<DrawerModel> drawerItemsList = [
    DrawerModel(
      icon: 'assets/images/svg/ic_drawer_notification.svg',
      title: AppString.notification,
    ),
    DrawerModel(
      icon: 'assets/images/svg/ic_drawer_privacy_policy.svg',
      title: AppString.privacyPolicy,
    ),
    DrawerModel(
      icon: 'assets/images/svg/ic_drawer_change_language.svg',
      title: AppString.changeLanguage,
    ),
    DrawerModel(
      icon: 'assets/images/svg/ic_drawer_change_fonts.svg',
      title: AppString.changeFontSize,
    ),
    DrawerModel(
      icon: 'assets/images/svg/ic_drawer_report_a_problem.svg',
      title: AppString.reportProblem,
    ),
    DrawerModel(
      icon: 'assets/images/svg/ic_drawer_help_and_support.svg',
      title: AppString.helpSupport,
    ),
    DrawerModel(
      icon: 'assets/images/svg/ic_drawer_delete_account.svg',
      title: AppString.deleteUser,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Drawer(
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Color(0xFFFAFAFA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  children: [
                    AppGestures(
                      onTap: () {
                        Navigator.pop(context);

                        CustomNavigator.pushNavigate(
                          context: context,
                          page: ProfileDetailsScreen(),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            ClipOval(
                              child: AppImage(
                                imagePath:
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRch6CDHA9hqbe3GbIo6O0T-EWeIL7JJ8_cpQ&s',
                                height: 70.h,
                                width: 70.w,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  spacing: 7,
                                  children: [
                                    Text(
                                      'Sarah Williams',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ).poppinsBold,
                                    ),
                                    Text(
                                      'user@gmail.com',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: theme.onSecondaryFixedVariant,
                                      ).poppinsRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: drawerItemsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = drawerItemsList[index];
                        bool selected = currentIndex == index;
                        return AppGestures(
                          onTap: () async {
                            setState(() {
                              currentIndex = index;
                            });
                            await Future.delayed(Duration(milliseconds: 200));
                            if (context.mounted) {
                              onItemIap(context: context, index: index);
                            }
                          },
                          child: Container(
                            height: 50.h,
                            margin: EdgeInsets.only(left: 30, right: 15),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: selected
                                  ? theme.primary.withValues(alpha: 0.2)
                                  : null,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 15,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      item.title.tr(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: selected
                                            ? theme.onSurface
                                            : theme.onSecondaryFixedVariant,
                                      ).poppinsRegular,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  width: 22.h,
                                  height: 22.w,
                                  child: SvgPicture.asset(
                                    item.icon,
                                    width: 22.h,
                                    height: 22.w,
                                    colorFilter: ColorFilter.mode(
                                      selected
                                          ? theme.onSurface
                                          : Color(0xFFA4A4A4),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                    ),
                  ],
                ),
              ),
            ),
            AppGestures(
              onTap: () {
                Navigator.pop(context);

                ShowPopUp.dialogueBox(
                  context: context,
                  body: LogoutUserAccountPopup(),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                margin: EdgeInsets.only(bottom: 0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 15,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Logout',
                          style: TextStyle(fontSize: 15).poppinsRegular,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 22.h,
                      height: 25.w,
                      child: SvgPicture.asset(
                        'assets/images/svg/ic_drawer_logout.svg',
                        width: 22.h,
                        height: 25.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onItemIap({required BuildContext context, required int index}) {
    Widget? page;
    if (index == 0) {
      page = DrawerNotificationScreen();
    } else if (index == 1) {
      page = DrawerPrivacyPolicyScreen();
    } else if (index == 2) {
      page = DrawerChangeLanguageScreen();
    } else if (index == 3) {
      page = DrawerChangeFontSizeScreen();
    } else if (index == 4) {
      page = DrawerReportAProblemScreen();
    } else if (index == 5) {
      page = DrawerHelpAndSupportScreen();
    }
    if (index == 6) {
      Navigator.pop(context);
      ShowPopUp.dialogueBox(context: context, body: DeleteUserAccountPopup());
    } else {
      CustomNavigator.pushNavigate(context: context, page: page!);
    }
  }
}
