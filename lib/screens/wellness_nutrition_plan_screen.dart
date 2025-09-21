import 'package:flutter/material.dart';
import 'dart:ui' as ui;
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
          spacing: 15,
          children: [
            Container(
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
                        Container(
                          alignment: Alignment.topRight,
                          child: AppText(
                            AppString.planName,
                            style: TextStyle(fontSize: 14).poppinsSemiBold,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: AppText(
                            'Mediterranean Diet',
                            style: TextStyle(fontSize: 16).poppinsSemiBold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Directionality(
                              textDirection: ui.TextDirection.rtl,
                              child: LinearProgressIndicator(
                                value: 0.4,
                                color: theme.primary,
                                minHeight: 6.h,
                                backgroundColor: theme.surface,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                spacing: 7,
                                children: [
                                  AppText(
                                    AppString.totalGoal,
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
                        ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            bool condition = (index % 2) == 0;
                            return Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    spacing: 7,
                                    children: [
                                      AppText(
                                        AppString.waterGoal,
                                        style: TextStyle(
                                          color: theme.onSecondaryFixedVariant,
                                          fontSize: 14,
                                        ).poppinsRegular,
                                      ),
                                      AppText(
                                        condition ? '10 L' : '75 L',
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
                                        condition ? '5 L' : '+ 0.2 L',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: !condition
                                              ? AppColors.colorRed
                                              : null,
                                        ).poppinsSemiBold,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 10.h);
                          },
                          itemCount: 2,
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
                                    AppString.remaining,
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                spacing: 7,
                                children: [
                                  AppText(
                                    AppString.remaining,
                                    style: TextStyle(
                                      color: theme.onSecondaryFixedVariant,
                                      fontSize: 14,
                                    ).poppinsRegular,
                                  ),
                                  AppText(
                                    '250 ml',
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
                                    AppString.waterConsumed,
                                    style: TextStyle(
                                      color: theme.onSecondaryFixedVariant,
                                      fontSize: 14,
                                    ).poppinsRegular,
                                  ),
                                  AppText(
                                    '500 ml',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ).poppinsSemiBold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                spacing: 7,
                                children: [
                                  AppText(
                                    AppString.remaining,
                                    style: TextStyle(
                                      color: theme.onSecondaryFixedVariant,
                                      fontSize: 14,
                                    ).poppinsRegular,
                                  ),
                                  AppText(
                                    '+0.2 kg',
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
                                    AppString.weightProgress,
                                    style: TextStyle(
                                      color: theme.onSecondaryFixedVariant,
                                      fontSize: 14,
                                    ).poppinsRegular,
                                  ),
                                  AppText(
                                    '75.2 Kg',
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
            _logDataWidget(
              icon: 'assets/images/svg/ic_water_drop.svg',
              title: AppString.waterIntake,
              value: '2.5 L/Day',
              button: AppButton(
                btnHeight: 30.h,
                textStyle: TextStyle(
                  color: theme.surface,
                  fontSize: 10,
                ).poppinsMedium,
                onPressed: () {
                  ShowPopUp.dialogueBox(
                    context: context,
                    body: NutritionLogWaterPopup(),
                  );
                },
                name: AppString.logWater,
              ),
            ),
            _logDataWidget(
              icon: 'assets/images/svg/ic_workout_plan.svg',
              title: AppString.weightInsight,
              value: '75.2 Kg',
              button: AppButton(
                btnHeight: 30.h,
                textStyle: TextStyle(
                  color: theme.surface,
                  fontSize: 10,
                ).poppinsMedium,
                onPressed: () {
                  ShowPopUp.dialogueBox(
                    context: context,
                    body: NutritionLogWeightPopup(),
                  );
                },
                name: AppString.logWeight,
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

  Widget _logDataWidget({
    required String icon,
    required String title,
    required String value,
    required Widget button,
  }) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: theme.outlineVariant),
      ),
      child: Row(
        spacing: 15,
        children: [
          Expanded(flex: 3, child: button),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 7,
              children: [
                AppText(title, style: TextStyle(fontSize: 14).poppinsSemiBold),
                AppText(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.onSurfaceVariant,
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
              color: Color(0xFFF5FFFE),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              icon,
              height: 20.h,
              width: 20.w,
              colorFilter: ColorFilter.mode(theme.primary, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
