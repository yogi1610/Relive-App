import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class ProfileChangePasswordScreen extends StatefulWidget {
  const ProfileChangePasswordScreen({super.key});

  @override
  State<ProfileChangePasswordScreen> createState() =>
      _ProfileChangePasswordScreenState();
}

class _ProfileChangePasswordScreenState
    extends State<ProfileChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      showAppBar: false,
      appBarTitle: AppString.changePassword,
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
                            child: AppNetworkImage(
                              image:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRch6CDHA9hqbe3GbIo6O0T-EWeIL7JJ8_cpQ&s',
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
                      child: changePasswordWidget(
                        title: AppString.oldPassword,
                        child: TextFormField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration().defaultTextField(
                            hintText: '',
                            context: context,
                          ),
                        ),
                      ),
                    ),
                    changePasswordWidget(
                      title: AppString.newPassword,
                      child: TextFormField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration().defaultTextField(
                          hintText: '',
                          context: context,
                        ),
                      ),
                    ),
                    changePasswordWidget(
                      title: AppString.confirmPassword,
                      child: TextFormField(
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
              textSize: 16.sp,
              padding: EdgeInsets.only(bottom: 10),
              onPressed: () {},
              name: AppString.updatePassword,
            ),
          ],
        ),
      ),
    );
  }

  Widget changePasswordWidget({required String title, required Widget child}) {
    return Column(
      spacing: 10,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: AppText(
            title,
            style: TextStyle(fontSize: 16).poppinsMedium,
          ),
        ),
        child,
      ],
    );
  }
}
