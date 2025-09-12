import 'package:flutter/material.dart';
import '../utils/app_files_imports.dart';

class ProgressReportMonthly extends StatefulWidget {
  const ProgressReportMonthly({super.key});

  @override
  State<ProgressReportMonthly> createState() => _ProgressReportMonthlyState();
}

class _ProgressReportMonthlyState extends State<ProgressReportMonthly> {
  final List<ChartData3> chartData3 = [
    ChartData3('Week 1', 9),
    ChartData3('Week 2', 8.5),
    ChartData3('Week 3', 4.5),
    ChartData3('Week 4', 8.5),
    ChartData3('Week 5', 3),
  ];

  final List<ChartData3> weightProgressChart = [
    ChartData3('Week 1', 162),
    ChartData3('Week 2', 165),
    ChartData3('Week 3', 158),
    ChartData3('Week 4', 168),
    ChartData3('Week 5', 164),
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
                'Select Month',
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
                    interval: 1,
                    labelStyle: TextStyle(
                      color: theme.onSecondaryFixedVariant,
                      fontSize: 10,
                    ).poppinsRegular,
                    majorGridLines: const MajorGridLines(
                      color: Colors.transparent,
                    ),
                    majorTickLines: const MajorTickLines(
                      color: Colors.transparent,
                    ),
                    axisLine: const AxisLine(color: Colors.transparent),
                  ),
                  plotAreaBorderWidth: 0,
                  series: <CartesianSeries<ChartData3, String>>[
                    LineSeries<ChartData3, String>(
                      dataSource: chartData3,
                      xValueMapper: (ChartData3 data, _) => data.day,
                      yValueMapper: (ChartData3 data, _) => data.value,
                      color: theme.primary,
                      // teal-like line color
                      width: 2,
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                        width: 6,
                        height: 6,
                        color: Color(0xFF418F8B),
                        borderColor: Color(0xFF418F8B),
                        shape: DataMarkerType.circle,
                      ),
                    ),
                  ],
                ),
              ),
              _divider(),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Medication Compliance',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
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
                    labelFormat: '{value}',
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
                    ColumnSeries<ChartData3, String>(
                      dataSource: chartData3,
                      trackColor: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.primary.withValues(alpha: 0.1),
                          theme.primary.withValues(alpha: 0.3),
                          theme.primary.withValues(alpha: 0.6),
                          theme.primary,
                        ],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                      xValueMapper: (ChartData3 data, _) => data.day,
                      yValueMapper: (ChartData3 data, _) => data.value,
                      spacing: 0.05,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Doctor Summary Notes',
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
                  'Overall stable progress, slight pain reduction. Patient has shown improvement in pain management with consistent medication adherence in weeks 1,2, and 4. Week 3 showed a dip in compliance that correlated with increased pain levels.',
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
                  'Fitness Overview ',
                  style: TextStyle(fontSize: 14).poppinsSemiBold,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: AppText(
                  'Weight Progress',
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
                    minimum: 150,
                    maximum: 180,
                    interval: 5,
                    labelStyle: TextStyle(
                      color: theme.onSecondaryFixedVariant,
                      fontSize: 10,
                    ).poppinsRegular,
                    majorGridLines: const MajorGridLines(color: Colors.transparent),
                    majorTickLines: const MajorTickLines(color: Colors.transparent),
                    axisLine: const AxisLine(color: Colors.transparent),
                  ),

                  plotAreaBorderWidth: 0,
                  series: <CartesianSeries<ChartData3, String>>[
                    LineSeries<ChartData3, String>(
                      dataSource: weightProgressChart,
                      xValueMapper: (ChartData3 data, _) => data.day,
                      yValueMapper: (ChartData3 data, _) => data.value,
                      color: theme.primary,
                      // teal-like line color
                      width: 2,
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                        width: 6,
                        height: 6,
                        color: Color(0xFF418F8B),
                        borderColor: Color(0xFF418F8B),
                        shape: DataMarkerType.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _divider() {
    return Divider(thickness: 1, color: Color(0xFFD2F1F3));
  }
}

class ChartData3 {
  final String day;
  final double value;

  ChartData3(this.day, this.value);
}
