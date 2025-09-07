import 'package:flutter/material.dart';
import 'package:relive_app/screens/wellness_fitness_plans_detail_screen.dart';
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
      bottomSafeArea: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15.h);
                },
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: AlwaysScrollableScrollPhysics(),
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
            ),
          ],
        ),
      ),
    );
  }
}
