import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class DrawerPrivacyPolicyScreen extends StatefulWidget {
  const DrawerPrivacyPolicyScreen({super.key});

  @override
  State<DrawerPrivacyPolicyScreen> createState() =>
      _DrawerPrivacyPolicyScreenState();
}

class _DrawerPrivacyPolicyScreenState extends State<DrawerPrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.privacyPolicy,
      body: Container(),
    );
  }
}
