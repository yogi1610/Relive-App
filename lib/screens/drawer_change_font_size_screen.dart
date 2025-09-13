import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class DrawerChangeFontSizeScreen extends StatefulWidget {
  const DrawerChangeFontSizeScreen({super.key});

  @override
  State<DrawerChangeFontSizeScreen> createState() =>
      _DrawerChangeFontSizeScreenState();
}

class _DrawerChangeFontSizeScreenState extends State<DrawerChangeFontSizeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.changeFontSize,
      body: Container(),
    );
  }
}
