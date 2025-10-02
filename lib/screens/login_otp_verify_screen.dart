import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relive_app/utils/app_files_imports.dart';
import 'dart:ui' as ui;

class LoginOtpVerifyScreen extends StatefulWidget {
  const LoginOtpVerifyScreen({super.key});

  @override
  State<LoginOtpVerifyScreen> createState() => _LoginOtpVerifyScreenState();
}

class _LoginOtpVerifyScreenState extends State<LoginOtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBarTitle: AppString.signIn,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: provider.verifyOtpFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      readOnly: true,
                      decoration: InputDecoration().prefixIconTextField(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: AppImage(
                            imagePath: 'assets/images/svg/ic_email_icon.svg',
                          ),
                        ),
                        hintText: AppString.enterEmail,
                        context: context,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: AppText(
                      AppString.enterOtp.tr(),
                      style: TextStyle(fontSize: 16).poppinsMedium,
                    ),
                  ),
                  Directionality(
                    textDirection: ui.TextDirection.rtl,
                    child: TextFormField(
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      controller: provider.otpController,
                      style: TextStyle(fontSize: 13).poppinsRegular,
                      textAlign: TextAlign.right,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      buildCounter:
                          (
                            BuildContext context, {
                            required int currentLength,
                            int? maxLength,
                            required bool isFocused,
                          }) => null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppString.enter6DigitOtp.tr();
                        } else if (value.length != 6) {
                          return AppString.otpMustBe6Digits.tr();
                        } else if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                          return AppString.invalidOtpFormat.tr();
                        }
                        return null; // ✅ valid
                      },
                      decoration: InputDecoration().prefixIconTextField(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SvgPicture.asset(
                            'assets/images/svg/ic_enter_otp.svg',
                            height: 25,
                            width: 25,
                            colorFilter: ColorFilter.mode(
                              Color(0xFFDADADA),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        hintText: AppString.enter6DigitOtp.tr(),
                        context: context,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Consumer<LoginProvider>(
                      builder: (context, pro, _) {
                        return pro.isResendAvailable
                            ? AppGestures(
                                onTap: () => pro.resendOtp(context),
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary, // highlight
                                    fontSize: 14,
                                  ).poppinsSemiBold,
                                ),
                              )
                            : RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Resend OTP in ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ).poppinsRegular,
                                    ),
                                    TextSpan(
                                      text: "${pro.resendSeconds}s",
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary, // highlight
                                        fontSize: 14,
                                      ).poppinsSemiBold,
                                    ),
                                  ],
                                ),
                              );
                      },
                    ),
                  ),

                  AppButton(
                    onPressed: () => provider.verifyOtp(context),
                    isLoading: provider.isVerifyLoading,
                    name: AppString.verifyOtp,
                    padding: EdgeInsets.only(top: 30),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
