import 'package:flutter/material.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class WellnessNutritionViewBreakdownScreen extends StatefulWidget {
  const WellnessNutritionViewBreakdownScreen({super.key});

  @override
  State<WellnessNutritionViewBreakdownScreen> createState() =>
      _WellnessNutritionViewBreakdownScreenState();
}

class _WellnessNutritionViewBreakdownScreenState
    extends State<WellnessNutritionViewBreakdownScreen> {
  List<Segment> segments = [
    Segment(value: 30, color: Color(0xFFEF4444)),
    Segment(value: 25, color: Color(0xFFEAB308)),
    Segment(value: 45, color: AppColors.kBlue),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: AppString.mealDetailsBreakdown,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 15,
          children: [
            Align(
              alignment: Alignment.center,
              child: AppText(
                AppString.totalCaloriesConsumed,
                style: TextStyle(fontSize: 16).poppinsMedium,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AppText(
                '400 Kcal',
                style: TextStyle(fontSize: 18).poppinsSemiBold,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 10),
              child: AppText(
                AppString.todaysMeals,
                style: TextStyle(fontSize: 16).poppinsMedium,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: theme.outline, width: 1),
              ),
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        '250 Kcal',
                        style: TextStyle(fontSize: 16).poppinsSemiBold,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 7,
                          children: [
                            AppText(
                              'Salmon',
                              style: TextStyle(fontSize: 16).poppinsMedium,
                            ),
                            AppText(
                              '100 grams',
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.onSecondaryFixedVariant,
                              ).poppinsMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      _foodValuesWidget(
                        color: AppColors.colorFat,
                        value: '10 g',
                        title: AppString.fat,
                      ),
                      _foodValuesWidget(
                        color: AppColors.colorCarbs,
                        value: '15 g',
                        title: AppString.carbs,
                      ),
                      _foodValuesWidget(
                        color: AppColors.colorProtein,
                        value: '25 g',
                        title: AppString.protein,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: theme.outline, width: 1),
              ),
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        '150 Kcal',
                        style: TextStyle(fontSize: 16).poppinsSemiBold,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 7,
                          children: [
                            AppText(
                              'Salmon',
                              style: TextStyle(fontSize: 16).poppinsMedium,
                            ),
                            AppText(
                              '125 grams',
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.onSecondaryFixedVariant,
                              ).poppinsMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      _foodValuesWidget(
                        color: AppColors.colorFat,
                        value: '12 g',
                        title: AppString.fat,
                      ),
                      _foodValuesWidget(
                        color: AppColors.colorCarbs,
                        value: '10 g',
                        title: AppString.carbs,
                      ),
                      _foodValuesWidget(
                        color: AppColors.colorProtein,
                        value: '30 g',
                        title: AppString.protein,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.dailyMacrosBreakdown,
                style: TextStyle(fontSize: 16).poppinsSemiBold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: theme.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            AppText(
                              '30 g',
                              style: TextStyle(fontSize: 18).poppinsSemiBold,
                            ),
                            AppText(
                              AppString.fat,
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondaryFixedVariant,
                              ).poppinsRegular,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            AppText(
                              '30 g',
                              style: TextStyle(fontSize: 18).poppinsSemiBold,
                            ),
                            AppText(
                              AppString.carbs,
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondaryFixedVariant,
                              ).poppinsRegular,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [
                            AppText(
                              '40 g',
                              style: TextStyle(fontSize: 18).poppinsSemiBold,
                            ),
                            AppText(
                              AppString.protein,
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondaryFixedVariant,
                              ).poppinsRegular,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PrimerProgressBar(
                    segments: segments,
                    showLegend: false,
                    maxTotalValue: 100,
                    legendStyle: SegmentedBarLegendStyle(
                      padding: EdgeInsets.zero,
                      spacing: 0,
                      runSpacing: 0,
                    ),
                    barStyle: SegmentedBarStyle(
                      padding: EdgeInsets.zero,
                      gap: 0.05,
                      size: 12.h,
                    ),
                  ),
                ],
              ),
            ),

            AppButton(
              btnHeight: 54.h,
              padding: EdgeInsets.only(top: 15),
              textStyle: TextStyle(
                fontSize: 14,
                color: theme.surface,
              ).poppinsMedium,
              onPressed: () {
                Navigator.pop(context);
              },
              name: AppString.markAsComplete,
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodValuesWidget({
    required Color color,
    required String value,
    required String title,
  }) {
    return Expanded(
      child: Container(
        height: 95.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            AppText(value, style: TextStyle(fontSize: 18).poppinsSemiBold),
            AppText(
              title,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
              ).poppinsRegular,
            ),
          ],
        ),
      ),
    );
  }
}
