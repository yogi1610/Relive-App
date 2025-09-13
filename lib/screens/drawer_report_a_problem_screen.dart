import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class DrawerReportAProblemScreen extends StatefulWidget {
  const DrawerReportAProblemScreen({super.key});

  @override
  State<DrawerReportAProblemScreen> createState() =>
      _DrawerReportAProblemScreenState();
}

class _DrawerReportAProblemScreenState extends State<DrawerReportAProblemScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.reportProblem,
      body: Container(),
    );
  }
}
