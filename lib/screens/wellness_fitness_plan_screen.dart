import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class WellnessFitnessPlanScreen extends StatefulWidget {
  const WellnessFitnessPlanScreen({super.key});

  @override
  State<WellnessFitnessPlanScreen> createState() =>
      _WellnessFitnessPlanScreenState();
}

class _WellnessFitnessPlanScreenState extends State<WellnessFitnessPlanScreen> {
  int selectedIndex = 0; // 0 = Daily, 1 = Weekly

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: AppString.fitnessPlan,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 15,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: AppText(
                        AppString.weeklyWorkoutRoutines,
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.onSecondaryFixedVariant,
                        ).poppinsRegular,
                      ),
                    ),
                    Row(
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
                    ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15.h);
                      },
                      itemCount: 3,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return AppGestures(
                          onTap: () {
                            CustomNavigator.pushNavigate(
                              context: context,
                              page: WellnessFitnessPlansDetailScreen(),
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
                              spacing: 10,
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 18,
                                  color: theme.onSecondaryFixedVariant,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    spacing: 5,
                                    children: [
                                      AppText(
                                        'Sunday',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: theme.onSecondaryFixedVariant,
                                        ).poppinsRegular,
                                      ),
                                      AppText(
                                        'Lower Body Focus',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ).poppinsSemiBold,
                                      ),
                                      AppText(
                                        'Duration - 50 minutes',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: theme.onSecondaryFixedVariant,
                                        ).poppinsRegular,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: AppImage(
                                    imagePath: (index % 2) == 0
                                        ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx4wcdL9c2XOJLtFLQXoUdAx2G7zSx8UKc0Q&s'
                                        : 'https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2024/02/upper-body-strength-training-exercises-scaled.jpg?fit=2560%2C1707&ssl=1',
                                    height: 66.h,
                                    width: 70.w,
                                  ),
                                ),
                                (index % 2) == 0
                                    ? SvgPicture.asset(
                                        'assets/images/svg/ic_status_completed.svg',
                                        height: 20.h,
                                        width: 20.w,
                                      )
                                    : SvgPicture.asset(
                                        'assets/images/svg/ic_status_pending.svg',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            _logFitnessDataWidget(
              icon: 'assets/images/svg/ic_steps_pedal.svg',
              title: AppString.stepsOverview,
              value: '7500',
              button: AppButton(
                btnHeight: 30.h,
                textStyle: TextStyle(
                  color: theme.surface,
                  fontSize: 10,
                ).poppinsMedium,
                onPressed: () {
                  ShowPopUp.dialogueBox(
                    context: context,
                    body: FitnessLogStepsPopup(),
                  );
                },
                name: AppString.logSteps,
              ),
            ),
            _logFitnessDataWidget(
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
                    body: FitnessLogWeightPopup(),
                  );
                },
                name: AppString.logWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logFitnessDataWidget({
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
