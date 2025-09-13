import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class DrawerChangeFontSizeScreen extends StatefulWidget {
  const DrawerChangeFontSizeScreen({super.key});

  @override
  State<DrawerChangeFontSizeScreen> createState() =>
      _DrawerChangeFontSizeScreenState();
}

class _DrawerChangeFontSizeScreenState
    extends State<DrawerChangeFontSizeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.changeFontSize,
      body: Consumer<FontSizeProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 15.h);
              },
              padding: EdgeInsets.zero,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: provider.fontSize.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final isSelected = provider.selectedIndex == index;
                var item = provider.fontSize[index];
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => provider.onSelectFontSize(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.secondaryContainer
                          : theme.surface,
                      border: Border.all(
                        color: isSelected
                            ? theme.secondaryContainer
                            : theme.outlineVariant,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        AppImage(
                          imagePath: isSelected
                              ? 'assets/images/svg/ic_radio_active.svg'
                              : 'assets/images/svg/ic_radio_inactive.svg',
                          height: 22.h,
                          width: 22.w,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: AppText(
                              item.type,
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected
                                    ? theme.onSurface
                                    : theme.onSecondaryFixedVariant,
                              ).poppinsMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
