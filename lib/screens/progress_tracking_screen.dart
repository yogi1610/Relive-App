import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:relive_app/providers/progress_tracking_provider.dart';
import 'package:relive_app/utils/app_files_imports.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressTrackingScreen extends StatefulWidget {
  const ProgressTrackingScreen({super.key});

  @override
  State<ProgressTrackingScreen> createState() => _ProgressTrackingScreenState();
}

class _ProgressTrackingScreenState extends State<ProgressTrackingScreen> {
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

    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.progressReport,
      hideBackButton: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Consumer<ProgressReportProvider>(
          builder: (context, provider, _) {
            return Column(
              spacing: 15,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(top: 15),
                  child: AppText(
                    'View Progress By',
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.onSecondaryFixedVariant,
                    ).poppinsRegular,
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: theme.secondaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppGestures(
                          onTap: () => provider.onTabChanged(0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            decoration: BoxDecoration(
                              color: provider.selectedTabIndex == 0
                                  ? theme.primary.withValues(alpha: 0.15)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            alignment: Alignment.center,
                            child: AppText(
                              AppString.daily,
                              style: TextStyle(
                                fontSize: 12,
                                color: provider.selectedTabIndex == 0
                                    ? theme.primary
                                    : theme.onSurface,
                              ).poppinsRegular,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AppGestures(
                          onTap: () => provider.onTabChanged(1),
                          child: AnimatedContainer(
                            width: 100,
                            duration: const Duration(milliseconds: 250),
                            decoration: BoxDecoration(
                              color: provider.selectedTabIndex == 1
                                  ? theme.primary.withValues(alpha: 0.15)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            alignment: Alignment.center,
                            child: AppText(
                              AppString.weekly,
                              style: TextStyle(
                                fontSize: 12,
                                color: provider.selectedTabIndex == 1
                                    ? theme.primary
                                    : theme.onSurface,
                              ).poppinsRegular,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: AppGestures(
                          onTap: () => provider.onTabChanged(2),
                          child: AnimatedContainer(
                            width: 100,
                            duration: const Duration(milliseconds: 250),
                            decoration: BoxDecoration(
                              color: provider.selectedTabIndex == 2
                                  ? theme.primary.withValues(alpha: 0.15)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            alignment: Alignment.center,
                            child: AppText(
                              'Monthly',
                              style: TextStyle(
                                fontSize: 12,
                                color: provider.selectedTabIndex == 2
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
                      _mildDiscomfortInfo(
                        title: 'Moderate Pain (5-7)',
                        color: Color(0xFF3270FF),
                      ),
                      _mildDiscomfortInfo(
                        title: 'Mild Pain (1-4)',
                        color: Color(0xFF4ADE80),
                      ),
                      _mildDiscomfortInfo(
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
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _mildDiscomfortInfo({required String title, required Color color}) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: AppText(
              title,
              style: TextStyle(fontSize: 12, color: color).poppinsMedium,
            ),
          ),
        ),
        Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
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
