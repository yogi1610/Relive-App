import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';
import 'dart:ui' as ui;

class WellnessFitnessPlansDetailScreen extends StatefulWidget {
  const WellnessFitnessPlansDetailScreen({super.key});

  @override
  State<WellnessFitnessPlansDetailScreen> createState() =>
      _WellnessFitnessPlansDetailScreenState();
}

class _WellnessFitnessPlansDetailScreenState
    extends State<WellnessFitnessPlansDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: 'Upper Body Strength',
      bottomSafeArea: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 15,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: theme.shadow,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                spacing: 10,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: AppText(
                      AppString.progress,
                      style: TextStyle(fontSize: 14).poppinsSemiBold,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: AppText(
                      '1/3 exercises',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.onSecondaryFixedVariant,
                      ).poppinsRegular,
                    ),
                  ),
                  Directionality(
                    textDirection: ui.TextDirection.rtl,
                    child: LinearProgressIndicator(
                      color: theme.onSurfaceVariant,
                      value: 0.4,
                      backgroundColor: theme.surface,
                      borderRadius: BorderRadius.circular(50),
                      minHeight: 6.h,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: AppText(
                      AppString.injection,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.onSecondaryFixedVariant,
                      ).poppinsRegular,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: AppText(
                      'High',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.colorRed,
                      ).poppinsSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.exercises,
                style: TextStyle(fontSize: 14).poppinsSemiBold,
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
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
                  child: Column(
                    spacing: 10,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: AppText(
                          'Push-ups',
                          style: TextStyle(fontSize: 14).poppinsSemiBold,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: AppImage(
                              imagePath: (index % 2) == 0
                                  ? 'https://barbend.com/wp-content/uploads/2023/10/seated-dumbbell-shoulder-press-barbend-movement-gif-masters-2.gif'
                                  : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNjecL3PVTpMHCsaD5jIMh-cEsVuQGYHDN-w&s',
                              height: 200.h,
                            ),
                          ),
                          Icon(
                            Icons.play_circle_filled_rounded,
                            size: 40,
                            color: theme.surface,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 5,
                                children: [
                                  AppText(
                                    AppString.restTime,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: theme.onSecondaryFixedVariant,
                                    ).poppinsRegular,
                                  ),
                                  AppText(
                                    '02 Minutes',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ).poppinsMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 5,
                                children: [
                                  AppText(
                                    AppString.reps,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: theme.onSecondaryFixedVariant,
                                    ).poppinsRegular,
                                  ),
                                  AppText(
                                    '10',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ).poppinsMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                spacing: 5,
                                children: [
                                  AppText(
                                    AppString.sets,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.onSecondaryFixedVariant,
                                    ).poppinsRegular,
                                  ),
                                  AppText(
                                    '5',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ).poppinsMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Visibility(
                          visible: (index % 2) == 0,
                          replacement: AppButton(
                            buttonColor: AppColors.kGreenLight,
                            btnHeight: 40.h,
                            btnWidth: 140.w,
                            onPressed: () {},
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: theme.surface,
                            ).poppinsRegular,
                            name: 'Completed',
                          ),
                          child: AppButton(
                            borderColor: AppColors.kGreenLight,
                            buttonColor: theme.surface,
                            btnHeight: 40.h,
                            btnWidth: 180.w,
                            onPressed: () {},
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: theme.onSurface,
                            ).poppinsRegular,
                            name: AppString.markAsComplete,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
