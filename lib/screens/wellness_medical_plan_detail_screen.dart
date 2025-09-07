import 'package:flutter/material.dart';
import 'package:relive_app/screens/consultation_chat_list_screen.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class WellnessMedicalPlanDetailScreen extends StatefulWidget {
  const WellnessMedicalPlanDetailScreen({super.key});

  @override
  State<WellnessMedicalPlanDetailScreen> createState() =>
      _WellnessMedicalPlanDetailScreenState();
}

class _WellnessMedicalPlanDetailScreenState
    extends State<WellnessMedicalPlanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: 'Vitamin B12 Injection',
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 15,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                'Vitamin B12 injections to help with energy levels and metabolism',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: theme.outlineVariant),
                boxShadow: [
                  BoxShadow(
                    color: theme.shadow, // shadow color
                    offset: Offset(0, 4), // x=0, y=4 (bottom)
                    blurRadius: 6, // softness of shadow
                    spreadRadius: 0, // only bottom
                  ),
                ],
              ),
              child: Column(
                spacing: 7,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: AppText(
                              'Pending',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.kGreen,
                              ).poppinsMedium,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: AppText(
                              'Status',
                              style: TextStyle(
                                fontSize: 16,
                                color: theme.onSecondaryFixedVariant,
                              ).poppinsRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1.5, color: theme.outlineVariant),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: AppText(
                              '1000mcg',
                              style: TextStyle(fontSize: 16).poppinsMedium,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: AppText(
                              'Dosage',
                              style: TextStyle(
                                fontSize: 16,
                                color: theme.onSecondaryFixedVariant,
                              ).poppinsRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1.5, color: theme.outlineVariant),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: AppText(
                              'Weekly',
                              style: TextStyle(fontSize: 16).poppinsMedium,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: AppText(
                              'Frequency',
                              style: TextStyle(
                                fontSize: 16,
                                color: theme.onSecondaryFixedVariant,
                              ).poppinsRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.nextReminder,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 18).poppinsSemiBold,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                'Sept 15, 10:00 AM',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16,
                  color: theme.primary,
                ).poppinsSemiBold,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.schedule,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 18).poppinsSemiBold,
              ),
            ),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.h);
              },
              itemCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: theme.secondaryContainer,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    spacing: 15,
                    children: [
                      SvgPicture.asset(
                        'assets/images/svg/ic_status_pending.svg',
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 7,
                          children: [
                            AppText(
                              '2023-09-15',
                              style: TextStyle(fontSize: 14).poppinsSemiBold,
                            ),
                            AppText(
                              '10:00 AM • 15 minutes',
                              style: TextStyle(
                                fontSize: 12,
                                color: theme.onSecondaryFixedVariant,
                              ).poppinsRegular,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.surface,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/svg/ic_bnb_meetings.svg',
                          height: 25.h,
                          width: 25.w,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.instructions,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 18).poppinsSemiBold,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.beforeTreatment,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 14).poppinsMedium,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                'No fasting required',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.afterTreatment,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 14).poppinsMedium,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                'May experience slight bruising at injection site',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 15),
              child: AppText(
                AppString.feedback,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 18).poppinsSemiBold,
              ),
            ),
            TextFormField(
              textAlign: TextAlign.right,
              maxLines: null,
              minLines: 4,
              decoration: InputDecoration().defaultTextField(
                hintText: 'Add any notes or side effects',
                context: context,
                borderRadius: 10,
                borderColor: theme.outlineVariant,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            AppButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              onPressed: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: ConsultationChatListScreen(),
                );
              },
              name: AppString.contactDoctor,
            ),
          ],
        ),
      ),
    );
  }
}
