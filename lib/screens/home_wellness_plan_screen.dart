import 'package:flutter/material.dart';

import 'package:relive_app/utils/app_files_imports.dart';
import 'dart:ui' as ui;

class HomeWellnessPlanScreen extends StatefulWidget {
  const HomeWellnessPlanScreen({super.key});

  @override
  State<HomeWellnessPlanScreen> createState() => _HomeWellnessPlanScreenState();
}

class _HomeWellnessPlanScreenState extends State<HomeWellnessPlanScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      allApis();
    });
  }

  allApis() {
    final wellnessProvider = Provider.of<WellnessProvider>(
      context,
      listen: false,
    );
    wellnessProvider.blogsApi(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: AppString.wellnessPlan,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 15,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.personalizedHealthRoadmap,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
            ),
            _wellnessWidget(
              icon: 'assets/images/svg/ic_nutrition_plan.svg',
              title: AppString.nutritionPlan,
              detail: 'Low-crab, 3 meals/day',
              onTap: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: WellnessNutritionPlanScreen(),
                );
              },
              progress: LinearProgressIndicator(
                value: 0.3,
                backgroundColor: AppColors.colorWhite,
                color: AppColors.kLavender,
                minHeight: 6.h,
                borderRadius: BorderRadius.circular(10),
              ),
              color: AppColors.kLavender,
            ),

            _wellnessWidget(
              icon: 'assets/images/svg/ic_workout_plan.svg',
              title: AppString.fitnessPlan,
              detail: 'Cardio + Strength, 5 days/week',
              onTap: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: WellnessFitnessPlanScreen(),
                );
              },
              progress: LinearProgressIndicator(
                value: 0.6,
                backgroundColor: AppColors.colorWhite,
                color: AppColors.kBlue,
                minHeight: 6.h,
                borderRadius: BorderRadius.circular(10),
              ),
              color: AppColors.kBlue,
            ),

            _wellnessWidget(
              icon: 'assets/images/svg/ic_medical_capsule.svg',
              title: AppString.medicalTreatmentPlan,
              detail: 'Injections and Supplements',
              onTap: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: WellnessMedicalPlanScreen(),
                );
              },
              progress: LinearProgressIndicator(
                value: 0.9,
                backgroundColor: AppColors.colorWhite,
                color: AppColors.kPink,
                minHeight: 6.h,
                borderRadius: BorderRadius.circular(10),
              ),
              color: AppColors.kPink,
            ),
            AppGestures(
              onTap: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: BlogsScreen(),
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: theme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  spacing: 15,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: theme.onSecondaryFixedVariant,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: AppText(
                          AppString.dailyBlogs,
                          style: TextStyle(fontSize: 18).poppinsSemiBold,
                        ),
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
                      child: SvgPicture.asset(
                        'assets/images/svg/ic_daily_blogs_book.svg',
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.todaysReminders,
                style: TextStyle(fontSize: 18).poppinsSemiBold,
              ),
            ),
            _reminderWidget(
              icon: 'assets/images/svg/ic_nutrition_plan.svg',
              iconColor: theme.onSecondaryFixedVariant,
              detail: '7:30 AM Greek Yogurt with Berries',
            ),
            _reminderWidget(
              icon: 'assets/images/svg/ic_workout_plan.svg',
              iconColor: theme.onSecondaryFixedVariant,
              detail: '7:Upper Body Strength 45 minutes',
            ),
          ],
        ),
      ),
    );
  }

  Widget _wellnessWidget({
    required String icon,
    required String title,
    required String detail,
    required VoidCallback onTap,
    required Widget progress,
    required Color color,
  }) {
    final theme = Theme.of(context).colorScheme;
    return AppGestures(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          spacing: 10,
          children: [
            Row(
              spacing: 15,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: theme.onSecondaryFixedVariant,
                ),
                Expanded(
                  child: Column(
                    spacing: 7,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        title,
                        style: TextStyle(fontSize: 14).poppinsSemiBold,
                      ),
                      AppText(
                        detail,
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.onSecondaryFixedVariant,
                        ).poppinsRegular,
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
                  child: SvgPicture.asset(
                    icon,
                    height: 23.h,
                    width: 23.w,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            Directionality(
              textDirection: ui.TextDirection.rtl,
              child: progress,
            ),
          ],
        ),
      ),
    );
  }

  Widget _reminderWidget({
    required String icon,
    required Color iconColor,
    required detail,
  }) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.secondaryFixed,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: AppText(
                detail,
                style: TextStyle(fontSize: 14).poppinsRegular,
              ),
            ),
          ),
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
