import 'package:flutter/material.dart';
import 'package:relive_app/screens/dashboard_screen.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class LoginChooseYourClinicScreen extends StatefulWidget {
  const LoginChooseYourClinicScreen({super.key});

  @override
  State<LoginChooseYourClinicScreen> createState() =>
      _LoginChooseYourClinicScreenState();
}

class _LoginChooseYourClinicScreenState
    extends State<LoginChooseYourClinicScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: AppString.chooseYourClinic,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          spacing: 15,
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 15),
              child: AppText(
                AppString.selectClinic,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
            ),
            TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration().suffixIconTextField(
                suffix: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: AppImage(
                    imagePath: 'assets/images/svg/ic_search_icon.svg',
                  ),
                ),
                hintText: AppString.searchClinic,
                context: context,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return AppGestures(
                  onTap: (){
                    CustomNavigator.pushNavigate(context: context, page: DashboardScreen(selectedPage: 0,),);
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: theme.surface,
                      border: Border.all(color: Color(0xFFEEEEEE), width: 1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: theme.shadow, // shadow color
                          offset: Offset(0, 4), // x=0, y=4 (bottom)
                          blurRadius: 6, // softness of shadow
                          spreadRadius: 0, // only bottom
                        ),
                      ],
                    ),

                    child: Row(
                      spacing: 15,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 20,
                          color: theme.onSecondaryFixedVariant,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            spacing: 5,
                            children: [
                              AppText(
                                'Wellness Control',
                                style: TextStyle(fontSize: 14).poppinsSemiBold,
                              ),
                              Row(
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppText(
                                    'California, USA',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.onSecondaryFixedVariant,
                                    ).poppinsRegular,
                                  ),
                                  AppImage(
                                    imagePath:
                                        'assets/images/svg/ic_location_marker.svg',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ClipOval(
                          child: AppImage(
                            imagePath:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxgQ-6BAIFPkMplkea7TVNAKlAe9F4PIQ4Hg&s',
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
