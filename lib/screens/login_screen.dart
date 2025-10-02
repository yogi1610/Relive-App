import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';
import 'dart:ui' as ui;
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: provider.sendOtpFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 15),
                child: AppText(
                  AppString.signIn,
                  style: TextStyle(fontSize: 24).poppinsSemiBold,
                ),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 10,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: AppText(
                            AppString.emailAddress,
                            style: TextStyle(fontSize: 16).poppinsMedium,
                          ),
                        ),
                        Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: TextFormField(
                            controller: provider.emailPhoneController,
                            style: TextStyle(fontSize: 13).poppinsRegular,
                            textAlign: TextAlign.right,
                            textInputAction: TextInputAction.done,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return AppString.enterAPhoneNumberOrEmail.tr();
                              } else if (text.contains('@') &&
                                  text.contains('.')) {
                                if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                ).hasMatch(text)) {
                                  return AppString
                                      .aValidEmailAddressMustBeEntered
                                      .tr();
                                }
                              } else if (text.length <= 10 &&
                                  RegExp(r'^[0-9]*$').hasMatch(text)) {
                                if (text.length < 10) {
                                  return AppString.enterA10DigitPhoneNumber
                                      .tr();
                                }
                              } else {
                                return AppString
                                    .aValidPhoneNumberEmailAddressMustBeEntered
                                    .tr();
                              }
                              return null; // Return null if the input is valid
                            },
                            decoration: InputDecoration().prefixIconTextField(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: AppImage(
                                  imagePath:
                                  'assets/images/svg/ic_email_icon.svg',
                                ),
                              ),
                              hintText: AppString.enterEmail,
                              context: context,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 35,
                                    child: Checkbox(
                                      value: provider.isRememberCheck,
                                      onChanged: (value) =>
                                          provider.onTapRememberMe(value),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          3,
                                        ), // circular corners
                                      ),
                                      fillColor:
                                      WidgetStateProperty.resolveWith<
                                          Color
                                      >((states) {
                                        if (states.contains(
                                          WidgetState.selected,
                                        )) {
                                          return Theme.of(context)
                                              .colorScheme
                                              .primary; // checked color
                                        }
                                        return Colors
                                            .transparent; // unchecked background
                                      }),
                                      side: BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                        // outline color
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  AppText(
                                    AppString.rememberMe,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ).poppinsRegular,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        AppButton(
                          onPressed: () => provider.sendOtp(context),
                          isLoading: provider.isLoading,
                          name: AppString.signIn,
                          padding: EdgeInsets.only(top: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: AppText(
                        AppString.privacyPolicy,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurfaceVariant,
                        ).poppinsLight,
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 6.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Flexible(
                      child: AppText(
                        AppString.termsAndConditions,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurfaceVariant,
                        ).poppinsLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
