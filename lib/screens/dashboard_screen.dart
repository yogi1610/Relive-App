import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class DashboardScreen extends StatefulWidget {
  final int selectedPage;

  const DashboardScreen({super.key, required this.selectedPage});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {



  @override
  void initState() {
    super.initState();
    // Set initial selected page
    final provider = Provider.of<DashboardProvider>(context, listen: false);
    provider.onNavBarItemTap(widget.selectedPage, false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        final currentIndex = provider.selectedPage;
        return AppScaffold(
          scaffoldKey: provider.scaffoldKey,
          showAppBar: !(currentIndex == 3),
          body: provider.navigationItems[currentIndex].page,
          drawer: DrawerScreen(),
          bottomNavigationBar: Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(provider.navigationItems.length, (index) {
                final item = provider.navigationItems[index];
                final isSelected = currentIndex == index;
                return GestureDetector(
                  onTap: () => provider.onNavBarItemTap(index),
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? Color(0xFFF8F8F8)
                          : Colors.transparent,
                    ),
                    child: SvgPicture.asset(
                      item.icon,
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        BlendMode.srcIn,
                      ),
                      height: 23.h,
                      width: 23.w,
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
