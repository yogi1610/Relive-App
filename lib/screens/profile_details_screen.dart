import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<DashboardProvider>(context);
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.profile,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          spacing: 15,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 150.h,
                          width: 150.w,
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: theme.secondaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: AppImage(
                              imagePath: provider.userImage,
                              errorWidget: AppImage(
                                imagePath: AppAssets.noProfileImage,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: theme.surface,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: theme.secondaryContainer,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add_rounded,
                                size: 30,
                                color: theme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: profileEditWidget(
                        title: AppString.fullName,
                        onEditTap: () {},
                        child: TextFormField(
                          controller: TextEditingController(
                            text: provider.userName,
                          ),
                          style: TextStyle(
                            fontSize: 14
                          ).poppinsRegular,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration().defaultTextField(
                            hintText: '',
                            context: context,
                          ),
                        ),
                      ),
                    ),
                    profileEditWidget(
                      title: AppString.emailAddress,
                      onEditTap: () {},
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        controller: TextEditingController(
                          text: provider.userEmail,
                        ),
                        style: TextStyle(
                            fontSize: 14
                        ).poppinsRegular,
                        decoration: InputDecoration().defaultTextField(
                          hintText: '',
                          context: context,
                        ),
                      ),
                    ),
                    profileEditWidget(
                      title: AppString.phoneOptional,
                      onEditTap: () {},
                      child: TextFormField(
                        controller: TextEditingController(
                          text: provider.userPhone,
                        ),
                        style: TextStyle(
                            fontSize: 14
                        ).poppinsRegular,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration().defaultTextField(
                          hintText: '',
                          context: context,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              btnHeight: 60.h,
              borderColor: theme.primary,
              padding: EdgeInsets.only(bottom: 10),
              buttonColor: Colors.transparent,
              textStyle: TextStyle(
                color: theme.onSurface,
                fontSize: 14,
              ).poppinsMedium,
              onPressed: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: ProfileChangePasswordScreen(),
                );
              },
              name: AppString.updatePassword,
            ),
          ],
        ),
      ),
    );
  }

  Widget profileEditWidget({
    required String title,
    required VoidCallback onEditTap,
    required Widget child,
  }) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      spacing: 10,
      children: [
        Row(
          children: [
            Container(
              height: 30.h,
              width: 30.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.primary.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mode_edit_outline_rounded,
                size: 18,
                color: theme.onSurface,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: AppText(
                  title,
                  style: TextStyle(fontSize: 16).poppinsMedium,
                ),
              ),
            ),
          ],
        ),
        child,
      ],
    );
  }
}
