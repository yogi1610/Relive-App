import 'package:flutter/material.dart';

import 'package:relive_app/utils/app_files_imports.dart';


class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int selectedIndex = 0; // 0 = Daily, 1 = Weekly

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.appointmentCalendar,
      hideBackButton: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 15),
              child: AppText(
                'Your Daily Meeting schedule',
                style: TextStyle(
                  fontSize: 14,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: theme.secondaryContainer,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => selectedIndex = 0),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                decoration: BoxDecoration(
                                  color: selectedIndex == 0
                                      ? theme.primary.withValues(alpha: 0.15)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                alignment: Alignment.center,
                                child: AppText(
                                  AppString.daily,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: selectedIndex == 0
                                        ? theme.primary
                                        : theme.onSurface,
                                  ).poppinsRegular,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => selectedIndex = 1),
                              child: AnimatedContainer(
                                width: 100,
                                duration: const Duration(milliseconds: 250),
                                decoration: BoxDecoration(
                                  color: selectedIndex == 1
                                      ? theme.primary.withValues(alpha: 0.15)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                alignment: Alignment.center,
                                child: AppText(
                                  AppString.weekly,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: selectedIndex == 1
                                        ? theme.primary
                                        : theme.onSurface,
                                  ).poppinsRegular,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 10,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 25,
                          color: theme.onSecondaryFixedVariant,
                        ),
                        Flexible(
                          child: AppText(
                            AppString.selectDate,
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.onSecondaryFixedVariant,
                            ).poppinsMedium,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/svg/ic_bnb_meetings.svg',
                          colorFilter: ColorFilter.mode(
                            theme.onSecondaryFixedVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            selectedIndex == 1
                ? Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: WeeklyDatePicker(),
                  )
                : SizedBox.shrink(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 15.h);
                  },
                  itemCount: 4,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AppGestures(
                      onTap: () {
                        CustomNavigator.pushNavigate(
                          context: context,
                          page: AppointmentDetailsScreen(),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: theme.surface,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: theme.outlineVariant),
                          boxShadow: [
                            BoxShadow(
                              color: theme.shadow, // shadow color
                              offset: Offset(0, 4), // x=0, y=4 (bottom)
                              blurRadius: 6, // softness of shadow
                              spreadRadius: 0, // only bottom
                            ),
                          ],
                        ),
                        child: Row(
                          spacing: 15,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 18,
                              color: theme.onSecondaryFixedVariant,
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 5,
                                  children: [
                                    AppText(
                                      'Nov 15, 2023',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: theme.onSecondaryFixedVariant,
                                      ).poppinsRegular,
                                    ),
                                    AppText(
                                      '9:00 AM',
                                      style: TextStyle(
                                        color: theme.onSecondaryFixedVariant,
                                        fontSize: 12,
                                      ).poppinsRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  spacing: 5,
                                  children: [
                                    AppText(
                                      'John Smith',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ).poppinsSemiBold,
                                    ),
                                    (index % 2) == 0
                                        ? AppText(
                                            'Injection',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.kGreen,
                                            ).poppinsRegular,
                                          )
                                        : AppText(
                                            'Consultation',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.kBlue,
                                            ).poppinsRegular,
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50.h,
                              width: 50.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: theme.secondaryContainer,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/images/svg/ic_bnb_meetings.svg',
                                height: 22.h,
                                width: 22.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            AppGestures(
              onTap: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: AddNewAppointmentScreen(),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: theme.surface,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: theme.primary, width: 1),
                ),
                child: Row(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 25, color: theme.onSurface),
                    AppText(
                      AppString.addNewAppointment,
                      style: TextStyle(fontSize: 14).poppinsSemiBold,
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
}
