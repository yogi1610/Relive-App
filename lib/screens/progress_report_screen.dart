import 'package:flutter/material.dart';

import 'package:relive_app/utils/app_files_imports.dart';

class ProgressReportScreen extends StatefulWidget {
  const ProgressReportScreen({super.key});

  @override
  State<ProgressReportScreen> createState() => _ProgressReportScreenState();
}

class _ProgressReportScreenState extends State<ProgressReportScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.progressReport,
      hideBackButton: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Consumer<ProgressReportProvider>(
          builder: (context, provider, _) {
            return Column(
              spacing: 15,
              children: [
                Container(
                  alignment: Alignment.topRight,
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
                provider.selectedTabIndex == 0
                    ? ProgressReportDailyView()
                    : provider.selectedTabIndex == 1
                    ? ProgressReportWeeklyView()
                    : ProgressReportMonthly(),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget mildDiscomfortInfo({required String title, required Color color}) {
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
