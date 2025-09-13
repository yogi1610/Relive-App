import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class DrawerHelpAndSupportScreen extends StatefulWidget {
  const DrawerHelpAndSupportScreen({super.key});

  @override
  State<DrawerHelpAndSupportScreen> createState() =>
      _DrawerHelpAndSupportScreenState();
}

class _DrawerHelpAndSupportScreenState extends State<DrawerHelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.helpAndSupport,
      body: Container(),
    );
  }
}
