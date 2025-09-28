import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class DrawerChangeLanguageScreen extends StatefulWidget {
  const DrawerChangeLanguageScreen({super.key});

  @override
  State<DrawerChangeLanguageScreen> createState() =>
      _DrawerChangeLanguageScreenState();
}

class _DrawerChangeLanguageScreenState
    extends State<DrawerChangeLanguageScreen> {
  int currentLanguageIndex = 0;
  String currentLanguageCode = '';

  @override
  void initState() {
    super.initState();
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    final locale = await AppLocalization.getSavedLocale();
    final lang = AppLocalization.getLanguageFromLocale(locale);
    setState(() {
      currentLanguageIndex = lang.index;
      currentLanguageCode = locale.languageCode;
    });
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.changeLanguage,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index){
            return SizedBox(height: 15.h,);
          },
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: AppLocalization.languageNames.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final isSelected = currentLanguageIndex == index;
            final languageName = AppLocalization.languageNames[index];

            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                setState(() {
                  currentLanguageIndex = index;
                });

                await AppLocalization.setLanguage(
                  AppLanguage.values[index],
                  context,
                );

                setState(() {
                  currentLanguageCode =
                      AppLocalization.languageCodes[AppLanguage.values[index]]!;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? theme.secondaryContainer : theme.surface,
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
                        child: Text(
                          languageName,
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
      ),
    );
  }
}
