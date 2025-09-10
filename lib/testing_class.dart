/*
import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:relive_app/utils/app_files_imports.dart';
import 'dart:ui' as ui;

import 'package:syncfusion_flutter_charts/charts.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      showAppBar: false,
      body: SingleChildScrollView(
        child: Column(
          spacing: 25,
          children: [
            Center(
              child: CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 15.0,
                percent: 0.6,
                // 6 out of 10 => 60%
                animation: true,
                circularStrokeCap: CircularStrokeCap.round,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "6",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "out of 10",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
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
            Container(
              decoration: BoxDecoration(color: theme.secondaryContainer),
              height: 250,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, maximum: 10),
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
                    width: 0.25,
                    spacing: 0.1,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


*/
