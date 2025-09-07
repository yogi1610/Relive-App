import 'package:flutter/material.dart';
import 'package:relive_app/screens/wellness_nutrition_add_food_log_screen.dart';
import 'package:relive_app/screens/wellness_nutrition_view_breakdown_screen.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class WellnessNutritionPlanScreen extends StatefulWidget {
  const WellnessNutritionPlanScreen({super.key});

  @override
  State<WellnessNutritionPlanScreen> createState() =>
      _WellnessNutritionPlanScreenState();
}

class _WellnessNutritionPlanScreenState
    extends State<WellnessNutritionPlanScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: AppString.nutritionPlan,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: theme.surface,
                  borderRadius: BorderRadius.circular(16),
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
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: theme.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          AppText(
                            AppString.nutritionDashboard,
                            style: TextStyle(fontSize: 20).poppinsSemiBold,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 7,
                                  children: [
                                    AppText(
                                      AppString.dailyGoal,
                                      style: TextStyle(
                                        color: theme.onSecondaryFixedVariant,
                                        fontSize: 14,
                                      ).poppinsRegular,
                                    ),
                                    AppText(
                                      '1000 Kcal',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ).poppinsSemiBold,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  spacing: 7,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppText(
                                      AppString.remaining,
                                      style: TextStyle(
                                        color: theme.onSecondaryFixedVariant,
                                        fontSize: 14,
                                      ).poppinsRegular,
                                    ),
                                    AppText(
                                      '750 Kcal',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ).poppinsSemiBold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: theme.primary.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: AppText(
                              'Today’s Summary',
                              style: TextStyle(fontSize: 18).poppinsMedium,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 7,
                                  children: [
                                    AppText(
                                      AppString.dailyGoal,
                                      style: TextStyle(
                                        color: theme.onSecondaryFixedVariant,
                                        fontSize: 14,
                                      ).poppinsRegular,
                                    ),
                                    AppText(
                                      '1000 Kcal',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ).poppinsSemiBold,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  spacing: 7,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppText(
                                      AppString.consumed,
                                      style: TextStyle(
                                        color: theme.onSecondaryFixedVariant,
                                        fontSize: 14,
                                      ).poppinsRegular,
                                    ),
                                    AppText(
                                      '750 Kcal',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ).poppinsSemiBold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            AppButton(
              btnHeight: 54.h,
              onPressed: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: WellnessNutritionAddFoodLogScreen(),
                );
              },
              padding: EdgeInsets.only(top: 100.h),
              name: AppString.logWhatYouAte,
              textStyle: TextStyle(
                fontSize: 14,
                color: theme.surface,
              ).poppinsMedium,
            ),
            AppButton(
              btnHeight: 54.h,
              onPressed: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: WellnessNutritionViewBreakdownScreen(),
                );
              },
              padding: EdgeInsets.only(top: 15),
              buttonColor: theme.surface,
              borderColor: theme.primary,
              name: AppString.viewBreakdown,
              textStyle: TextStyle(
                fontSize: 14,
                color: theme.onSurface,
              ).poppinsMedium,
            ),
          ],
        ),
      ),
    );
  }
}
