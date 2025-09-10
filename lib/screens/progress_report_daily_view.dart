import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:relive_app/screens/progress_report_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import '../utils/app_files_imports.dart';

class ProgressReportDailyView extends StatefulWidget {
  const ProgressReportDailyView({super.key});

  @override
  State<ProgressReportDailyView> createState() => _ProgressReportDailyViewState();
}

class _ProgressReportDailyViewState extends State<ProgressReportDailyView> {
  final List<ChartData> chartData = [
    ChartData("Day 1", 40, Color(0xFF3270FF)),
    ChartData("Day 2", 30, Color(0xFF4ADE80)),
    ChartData("Day 3", 35, Color(0xFFEF4444)),
    ChartData("Day 4", 50, Color(0xFF3270FF)),
    ChartData("Day 5", 45, Color(0xFF4ADE80)),
    ChartData("Day 6", 25, Color(0xFFEF4444)),
    ChartData("Day 7", 38, Color(0xFF3270FF)),
  ];


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      spacing: 15,
      children: [
        Row(
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
                'Today',
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
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
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
            spacing: 15,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Medical Overview',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Activity Summary',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsMedium,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AppText(
                  'Pain Score',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 20.0,
                  percent: 0.6,
                  // 6 out of 10 => 60%
                  animation: true,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        "6",
                        style: TextStyle(fontSize: 26).poppinsSemiBold,
                      ),
                      AppText(
                        "out of 10",
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.onSecondaryFixedVariant,
                        ).poppinsRegular,
                      ),
                    ],
                  ),
                  linearGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF00C3B9).withValues(alpha: 0.1),
                      Color(0xFF00C3B9).withValues(alpha: 0.3),
                      Color(0xFF00C3B9).withValues(alpha: 0.4),
                      Color(0xFF00C3B9).withValues(alpha: 0.5),
                      Color(0xFF00C3B9),
                    ],
                  ),
                  backgroundColor: Color(0xFFDFF6F6),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AppText(
                  'Mild discomfort in lower back',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsRegular,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 50),
                height: 125,
                child: SfCartesianChart(
                  margin: EdgeInsets.zero,
                  primaryXAxis: CategoryAxis(isVisible: false),
                  // hide x-axis
                  primaryYAxis: NumericAxis(isVisible: false),
                  // hide y-axis
                  plotAreaBorderWidth: 0,
                  series: <CartesianSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      pointColorMapper: (ChartData data, _) =>
                      data.color,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      width: 0.8,
                      // bar width
                      spacing: 0.0, // space between bars
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AppText(
                  'Last 7 days trend',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsSemiBold,
                ),
              ),
              mildDiscomfortInfo(
                title: 'Moderate Pain (5-7)',
                color: Color(0xFF3270FF),
              ),
              mildDiscomfortInfo(
                title: 'Mild Pain (1-4)',
                color: Color(0xFF4ADE80),
              ),
              mildDiscomfortInfo(
                title: 'Severe Pain (8-10)',
                color: Color(0xFFEF444F),
              ),
              Divider(thickness: 1, color: Color(0xFFD2F1F3)),
              Row(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      CircularPercentIndicator(
                        radius: 15.0,
                        lineWidth: 5.0,
                        percent: 0.6,
                        // 6 out of 10 => 60%
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColors.kGreenLight,
                        backgroundColor: Color(0xFFDFF6F6),
                      ),
                      AppText(
                        '75 %',
                        style: TextStyle(fontSize: 14).poppinsSemiBold,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AppText(
                        'Today’s Medications',
                        style: TextStyle(fontSize: 14).poppinsSemiBold,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        (index % 2) == 0
                            ? Icon(
                          Icons.close_rounded,
                          color: AppColors.colorRed,
                        )
                            : Icon(
                          Icons.done_rounded,
                          color: AppColors.kGreenLight,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 10,
                            children: [
                              AppText(
                                '200mg • As needed',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.onSecondaryFixedVariant,
                                ).poppinsRegular,
                              ),
                              AppText(
                                'Vitamin C',
                                style: TextStyle(
                                  fontSize: 14,
                                ).poppinsMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: 3,
              ),
              Divider(thickness: 1, color: Color(0xFFD2F1F3)),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Doctor Notes',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: AppText(
                  'Patient reported less stiffness in the morning. Continue with current medication regimen and follow up in two weeks.',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsRegular,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
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
            spacing: 15,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Fitness Details',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Activity Summary',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsMedium,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Weight',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsSemiBold,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  '165 lbs',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
              Row(
                children: [
                  AppText(
                    '7,200 / 8,000',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.onSecondaryFixedVariant,
                    ).poppinsRegular,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 10,
                      children: [
                        AppText(
                          'Steps Today',
                          style: TextStyle(
                            fontSize: 14,
                          ).poppinsSemiBold,
                        ),
                        SvgPicture.asset(
                          'assets/images/svg/ic_steps_pedal.svg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Directionality(
                  textDirection: ui.TextDirection.rtl,
                  child: LinearProgressIndicator(
                    value: 0.6,
                    color: AppColors.kBlue,
                    minHeight: 8.h,
                    backgroundColor: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Row(
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      CircularPercentIndicator(
                        radius: 15.0,
                        lineWidth: 5.0,
                        percent: 0.6,
                        // 6 out of 10 => 60%
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: AppColors.kBlue,
                        backgroundColor: Color(0xFFE9F0FF),
                      ),
                      AppText(
                        '60 %',
                        style: TextStyle(fontSize: 14).poppinsSemiBold,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: AppText(
                        'Today’s Completions',
                        style: TextStyle(fontSize: 14).poppinsSemiBold,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        (index % 2) == 0
                            ? Icon(
                          Icons.close_rounded,
                          color: AppColors.colorRed,
                        )
                            : Icon(
                          Icons.done_rounded,
                          color: AppColors.kGreenLight,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 10,
                            children: [
                              AppText(
                                '15 minutes • Upper Body',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.onSecondaryFixedVariant,
                                ).poppinsRegular,
                              ),
                              AppText(
                                'Morning Run',
                                style: TextStyle(
                                  fontSize: 14,
                                ).poppinsMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: 3,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
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
            spacing: 15,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Nutrition Details',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Activity Summary',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsMedium,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Water Intake',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsSemiBold,
                ),
              ),
              Column(
                spacing: 5,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: AppText(
                            '72%',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.kPurple,
                            ).poppinsSemiBold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AppText(
                            '1.8L / 2.5L',
                            style: TextStyle(
                              fontSize: 10,
                              color: theme.onSecondaryFixedVariant,
                            ).poppinsRegular,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Directionality(
                      textDirection: ui.TextDirection.rtl,
                      child: LinearProgressIndicator(
                        value: 0.6,
                        color: AppColors.kPurple,
                        minHeight: 6.h,
                        backgroundColor: Color(0xFFFAF5FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: AppText(
            'Summary Highlights',
            style: TextStyle(fontSize: 14).poppinsSemiBold,
          ),
        ),
        ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.h);
          },
          itemCount: 2,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFFFAFBFC),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 5,
                children: [
                  AppText(
                    '5% better than previous day',
                    style: TextStyle(fontSize: 14).poppinsMedium,
                  ),
                  AppText(
                    'Overall wellness score improved',
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.onSecondaryFixedVariant,
                    ).poppinsRegular,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

}

class ChartData {
  final String x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}