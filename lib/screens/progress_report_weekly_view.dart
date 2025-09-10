import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:relive_app/screens/progress_report_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import '../utils/app_files_imports.dart';

class ProgressReportWeeklyView extends StatefulWidget {
  const ProgressReportWeeklyView({super.key});

  @override
  State<ProgressReportWeeklyView> createState() =>
      _ProgressReportWeeklyViewState();
}

class _ProgressReportWeeklyViewState extends State<ProgressReportWeeklyView> {
  final List<ChartData1> chartData1 = [
    ChartData1("Sun", 4, Color(0xFF4ADE80)),
    ChartData1("Mon", 8, Color(0xFFEF4444)),
    ChartData1("Tue", 6, Color(0xFF3270FF)),
    ChartData1("Wed", 9, Color(0xFFEF4444)),
    ChartData1("Thu", 3, Color(0xFF4ADE80)),
    ChartData1("Fri", 7, Color(0xFF3270FF)),
    ChartData1("Sat", 6, Color(0xFF3270FF)),
  ];

  final List<ChartData2> chartData = [
    ChartData2('Sat', 9),
    ChartData2('Sun', 8.5),
    ChartData2('Mon', 4.5),
    ChartData2('Tue', 8.5),
    ChartData2('Wed', 3),
    ChartData2('Thu', 7),
    ChartData2('Fri', 9),
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
                'Select Week',
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
                  'Medical Overview ',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Average Pain Score',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsMedium,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: theme.secondaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 300.h,
                padding: EdgeInsets.all(15),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(color: Colors.transparent),
                    majorTickLines: MajorTickLines(color: Colors.transparent),
                    axisLine: AxisLine(color: Colors.transparent),
                    labelStyle: TextStyle(
                      color: theme.onSecondaryFixedVariant,
                      fontSize: 10,
                    ).poppinsRegular,
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 10,
                    labelStyle: TextStyle(
                      color: theme.onSecondaryFixedVariant,
                      fontSize: 10,
                    ).poppinsRegular,
                    majorGridLines: MajorGridLines(color: Colors.transparent),
                    majorTickLines: MajorTickLines(color: Colors.transparent),
                    axisLine: AxisLine(color: Colors.transparent),
                  ),
                  plotAreaBorderWidth: 0,
                  series: <CartesianSeries<ChartData1, String>>[
                    // Foreground bars (actual values)
                    ColumnSeries<ChartData1, String>(
                      dataSource: chartData1,
                      isTrackVisible: true,
                      trackColor: Colors.white,
                      xValueMapper: (ChartData1 data, _) => data.day,
                      yValueMapper: (ChartData1 data, _) => data.value,
                      pointColorMapper: (ChartData1 data, _) => data.color,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      width: 0.2,
                      spacing: 0.1,
                    ),
                  ],
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
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Medication Log Summary',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsSemiBold,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          AppText(
                            '5/7',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.onSecondaryFixedVariant,
                            ).poppinsRegular,
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: AppText(
                                'Vitamin D',
                                style: TextStyle(fontSize: 14).poppinsMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Directionality(
                        textDirection: ui.TextDirection.rtl,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(8),
                          child: LinearProgressIndicator(
                            color: Color(0xFFBAF7F7),
                            borderRadius: BorderRadiusGeometry.circular(8),
                            value: (index % 2) == 0 ? 0.4 : 0.8,
                            minHeight: 8.h,
                            backgroundColor: theme.secondaryContainer,
                          ),
                        ),
                      ),
                    ],
                  );
                },
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
                        'Medication Compliance',
                        style: TextStyle(fontSize: 14).poppinsSemiBold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: theme.secondaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 300.h,
                padding: EdgeInsets.all(15),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(
                      color: Colors.transparent,
                    ),
                    majorTickLines: const MajorTickLines(
                      color: Colors.transparent,
                    ),
                    axisLine: const AxisLine(color: Colors.transparent),
                    labelStyle: TextStyle(
                      color: theme.onSecondaryFixedVariant,
                      fontSize: 10,
                    ).poppinsRegular,
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 10,
                    interval: 2,
                    labelFormat: '{value}0%',
                    majorGridLines: const MajorGridLines(
                      color: Colors.transparent,
                    ),
                    majorTickLines: const MajorTickLines(
                      color: Colors.transparent,
                    ),
                    axisLine: const AxisLine(color: Colors.transparent),
                    labelStyle: TextStyle(
                      color: theme.onSecondaryFixedVariant,
                      fontSize: 10,
                    ).poppinsRegular,
                  ),
                  plotAreaBorderWidth: 0,
                  series: <CartesianSeries>[
                    ColumnSeries<ChartData2, String>(
                      dataSource: chartData,
                      trackColor: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1DCF5E).withValues(alpha: 0.15),
                          Color(0xFF1DCF5E).withValues(alpha: 0.3),
                          Color(0xFF1DCF5E).withValues(alpha: 0.8),
                          Color(0xFF1DCF5E),
                        ],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      xValueMapper: (ChartData2 data, _) => data.day,
                      yValueMapper: (ChartData2 data, _) => data.value,
                      spacing: 0.05,
                    ),
                  ],
                ),
              ),
              Row(
                spacing: 15,
                children: [
                  Flexible(
                    child: Expanded(
                      child: mildDiscomfortInfo(
                        title: 'Completed ( > 60%)',
                        color: Color(0xFF4ADE80),
                      ),
                    ),
                  ),
                  Flexible(
                    child: mildDiscomfortInfo(
                      title: 'Skipped ( < 40%)',
                      color: Color(0xFFEF444F),
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1, color: Color(0xFFD2F1F3)),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Weekly Highlights',
                  style: TextStyle(
                    fontSize: 14,
                    color: theme.onSecondaryFixedVariant,
                  ).poppinsSemiBold,
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
                          '7.5/10',
                          style: TextStyle(fontSize: 14).poppinsMedium,
                        ),
                        AppText(
                          'Avg. Medication Log Acheived',
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
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Clinic Notes Summary',
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
                  'Less back pain overall this week. Patient has been consistent with physical therapy exercise. Medication compliance Improved on weekdays',
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
      ],
    );
  }
}

class ChartData1 {
  final String day;
  final double value;
  final Color color;

  ChartData1(this.day, this.value, this.color);
}

class ChartData2 {
  final String day;
  final double value;

  ChartData2(this.day, this.value);
}
