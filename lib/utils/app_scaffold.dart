import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;
  final bool? showAppBar;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final bool? topSafeArea;
  final bool? bottomSafeArea;
  final Color? backgroundColor;
  final String? appBarTitle;

  const AppScaffold({
    super.key,
    required this.body,
    this.showAppBar,
    this.appBar,
    this.bottomNavigationBar,
    this.topSafeArea,
    this.bottomSafeArea,
    this.floatingActionButton,
    this.backgroundColor,
    this.floatingActionButtonLocation,
    this.appBarTitle,
    this.resizeToAvoidBottomInset = false,
  });

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset ?? false,
      appBar: (widget.showAppBar ?? true)
          ? (widget.appBar ?? const AppBarHeader())
          : null,
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButtonLocation:
          widget.floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerDocked,
      backgroundColor:
          widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
      body: SafeArea(
        top: widget.topSafeArea ?? true,
        bottom: widget.bottomSafeArea ?? true,
        child: Column(
          children: [
            Visibility(
              visible: widget.appBarTitle != null,
              child: AppBarContent(title: widget.appBarTitle ?? ''),
            ),
            Expanded(child: widget.body),
          ],
        ),
      ),
    );
  }
}
