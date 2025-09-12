import 'package:flutter/material.dart';

import '../utils/app_files_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        spacing: 15,
        children: [
          Row(
            spacing: 15,
            children: [
              AppImage(
                imagePath: 'assets/images/svg/ic_notification_inactive.svg',
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 5,
                  children: [
                    AppText(
                      'Good Morning Sarah!',
                      style: TextStyle(fontSize: 14).poppinsSemiBold,
                    ),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppText(
                          'California, USA',
                          style: TextStyle(
                            fontSize: 14,
                            color: theme.onSecondaryFixedVariant,
                          ).poppinsRegular,
                        ),
                        AppImage(
                          imagePath: 'assets/images/svg/ic_location_marker.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ClipOval(
                child: AppImage(
                  imagePath:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRch6CDHA9hqbe3GbIo6O0T-EWeIL7JJ8_cpQ&s',
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: theme.secondaryContainer,
            ),
            child: Column(
              spacing: 10,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: AppText(
                    AppString.todaysPlan,
                    style: TextStyle(fontSize: 18).poppinsSemiBold,
                  ),
                ),
                WeeklyDatePicker(),
                _todayPlanWidget(
                  context: context,
                  icon: 'assets/images/svg/ic_injection.svg',
                  title: AppString.injection,
                  detail: '10:30 AM with Dr. Mia',
                ),
                _todayPlanWidget(
                  context: context,
                  icon: 'assets/images/svg/ic_meal_plan.svg',
                  title: AppString.mealPlan,
                  detail: 'High protein, low carb',
                ),
                _todayPlanWidget(
                  context: context,
                  icon: 'assets/images/svg/ic_workout_plan.svg',
                  title: AppString.workoutPlan,
                  detail: '30 min cardio + strength',
                ),
              ],
            ),
          ),
          AppGestures(
            onTap: () {
              CustomNavigator.pushNavigate(
                context: context,
                page: AddPainScoreScreen(),
              );
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: theme.primary.withValues(alpha: 0.1),
              ),
              child: Row(
                spacing: 15,
                children: [
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 20,
                    color: theme.onSecondaryFixedVariant,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      spacing: 5,
                      children: [
                        AppText(
                          AppString.painScore,
                          style: TextStyle(fontSize: 14).poppinsSemiBold,
                        ),
                        AppText(
                          'Enter Your Overall Pain Score',
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.onSecondaryFixedVariant,
                          ).poppinsMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: AppImage(
                      imagePath: 'assets/images/svg/ic_pain_score.svg',
                      height: 22,
                      width: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: AppText(
              AppString.quickStats,
              style: TextStyle(fontSize: 18).poppinsSemiBold,
            ),
          ),
          Row(
            spacing: 10,
            children: [
              _quickStatsWidget(
                context: context,
                icon: 'assets/images/svg/ic_improvement_week.svg',
                title: AppString.improvementThisWeek,
              ),
              _quickStatsWidget(
                context: context,
                icon: 'assets/images/svg/ic_bnb_meetings.svg',
                title: AppString.upcomingAppointments,
              ),
              _quickStatsWidget(
                context: context,
                icon: 'assets/images/svg/ic_active_plan.svg',
                title: AppString.activePlans,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: AppText(
              AppString.quickAccess,
              style: TextStyle(fontSize: 18).poppinsSemiBold,
            ),
          ),

          Row(
            spacing: 15,
            children: [
              _quickAccessWidget(
                context: context,
                icon: 'assets/images/svg/ic_bnb_meetings.svg',
                color: AppColors.kGreen,
                title: AppString.scheduleAppointment,
                onTap: () {
                  context.read<DashboardProvider>().onNavBarItemTap(1);
                },
              ),
              _quickAccessWidget(
                context: context,
                icon: 'assets/images/svg/ic_meal_plan.svg',
                color: AppColors.kPurple,
                title: AppString.wellnessPlan,
                onTap: () {
                  CustomNavigator.pushNavigate(
                    context: context,
                    page: HomeWellnessPlanScreen(),
                  );
                },
              ),
            ],
          ),
          Row(
            spacing: 15,
            children: [
              _quickAccessWidget(
                context: context,
                icon: 'assets/images/svg/ic_consult_a_doctor.svg',
                color: AppColors.kTeal,
                title: AppString.consultDoctor,
                onTap: () {
                  CustomNavigator.pushNavigate(
                    context: context,
                    page: ConsultationChatListScreen(),
                  );
                },
              ),
              _quickAccessWidget(
                context: context,
                icon: 'assets/images/svg/ic_progress_report.svg',
                color: AppColors.kOlive,
                title: AppString.progressReport,
                onTap: () {
                  context.read<DashboardProvider>().onNavBarItemTap(2);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _todayPlanWidget({
    required BuildContext context,
    required String icon,
    required String title,
    required String detail,
  }) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: theme.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: theme.outlineVariant),
      ),
      child: Row(
        spacing: 15,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 5,
              children: [
                AppText(title, style: TextStyle(fontSize: 14).poppinsSemiBold),
                AppText(
                  detail,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsMedium,
                ),
              ],
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
            child: AppImage(imagePath: icon, height: 22, width: 22),
          ),
        ],
      ),
    );
  }

  Widget _quickStatsWidget({
    required BuildContext context,
    required String icon,
    required String title,
  }) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        height: 125.h,
        decoration: BoxDecoration(
          color: theme.secondaryFixed,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.surface,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                icon,
                height: 17.h,
                width: 17.w,
                colorFilter: ColorFilter.mode(theme.onSurface, BlendMode.srcIn),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: AppText(
                title,
                style: TextStyle(fontSize: 11).poppinsMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickAccessWidget({
    required BuildContext context,
    required String icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context).colorScheme;
    return Expanded(
      child: AppGestures(
        onTap: onTap,
        child: Container(
          height: 165.h,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Container(
                height: 60.h,
                width: 60.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.surface,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  icon,
                  height: 25.h,
                  width: 25.w,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: AppText(
                  title,
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
