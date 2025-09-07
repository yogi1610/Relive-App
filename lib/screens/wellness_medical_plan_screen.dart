import 'package:flutter/material.dart';
import 'package:relive_app/providers/medical_plan_provider.dart';
import 'package:relive_app/screens/wellness_medical_plan_detail_screen.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class WellnessMedicalPlanScreen extends StatefulWidget {
  const WellnessMedicalPlanScreen({super.key});

  @override
  State<WellnessMedicalPlanScreen> createState() =>
      _WellnessMedicalPlanScreenState();
}

class _WellnessMedicalPlanScreenState extends State<WellnessMedicalPlanScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      bottomSafeArea: false,
      appBarTitle: AppString.medicalPlan,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Consumer<MedicalPlanProvider>(
          builder: (context, provider, _) {
            return Column(
              spacing: 15,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: AppText(
                    AppString.treatmentsAndMedications,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.onSecondaryFixedVariant,
                    ).poppinsRegular,
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      spacing: 15,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: AppGestures(
                                onTap: provider.onTapUnit,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.surface,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: theme.outlineVariant,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10,
                                    children: [
                                      Flexible(
                                        child: AppText(
                                          provider.selectedStatus,
                                          style: TextStyle(
                                            fontSize: 13,
                                            color:
                                                theme.onSecondaryFixedVariant,
                                          ).poppinsRegular,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 25,
                                        color: theme.onSecondaryFixedVariant,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 25,
                                    color: theme.onSecondaryFixedVariant,
                                  ),
                                  Flexible(
                                    child: AppText(
                                      AppString.selectDate,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: theme.onSecondaryFixedVariant,
                                      ).poppinsMedium,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/images/svg/ic_bnb_meetings.svg',
                                    colorFilter: ColorFilter.mode(
                                      theme.onSecondaryFixedVariant,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 15.h);
                          },
                          itemCount: 5,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return AppGestures(
                              onTap: () {
                                CustomNavigator.pushNavigate(
                                  context: context,
                                  page: WellnessMedicalPlanDetailScreen(),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: theme.surface,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: theme.outlineVariant,
                                  ),
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
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 30.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(
                                              0xFF2FAE69,
                                            ).withValues(alpha: 0.2),
                                            borderRadius: BorderRadius.circular(
                                              40,
                                            ),
                                          ),
                                          child: AppText(
                                            'Pending',
                                            style: TextStyle(
                                              color: Color(0xFF2FAE69),
                                              fontSize: 10,
                                            ).poppinsRegular,
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: AppText(
                                              'Sunday, 10:00 AM',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: theme
                                                    .onSecondaryFixedVariant,
                                              ).poppinsRegular,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AppText(
                                      'Vitamin B12 Injection',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ).poppinsSemiBold,
                                    ),
                                    AppText(
                                      'Prescribed by Dr. Dr. Smith',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: theme.onSecondaryFixedVariant,
                                      ).poppinsRegular,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Frequency : ",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ).poppinsMedium,
                                          ),
                                          TextSpan(
                                            text: "Weekly",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  theme.onSecondaryFixedVariant,
                                            ).poppinsRegular,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              spacing: 7,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .arrow_back_ios_new_rounded,
                                                  size: 17,
                                                  color: theme
                                                      .onSecondaryFixedVariant,
                                                ),
                                                Flexible(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: "Reminder : ",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                theme.primary,
                                                          ).poppinsMedium,
                                                        ),
                                                        TextSpan(
                                                          text: "In 15 Min",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: theme
                                                                .onSecondaryFixedVariant,
                                                          ).poppinsRegular,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          (index % 2) == 0
                                              ? AppButton(
                                                  btnHeight: 35.h,
                                                  btnWidth: 140.w,
                                                  buttonColor: theme.primary
                                                      .withValues(alpha: 0.5),
                                                  onPressed: () {},
                                                  textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: theme.onSurface,
                                                  ).poppinsRegular,
                                                  name: 'Done',
                                                )
                                              : AppButton(
                                                  btnHeight: 35.h,
                                                  btnWidth: 140.w,
                                                  borderColor: theme.primary,
                                                  buttonColor: theme.primary
                                                      .withValues(alpha: 0.1),
                                                  onPressed: () {},
                                                  textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: theme.onSurface,
                                                  ).poppinsRegular,
                                                  name: AppString.markAsDone,
                                                ),
                                        ],
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
                    if (provider.isStatusDropdownOpen)
                      Positioned(
                        top: 55.h,
                        left: 0,
                        right: 220.w,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 165.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: provider.statusList.map((e) {
                                final isSelected = e == provider.selectedStatus;
                                return AppGestures(
                                  onTap: () {
                                    provider.onTapUnitItem(
                                      provider.statusList.indexOf(e),
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 7,
                                      horizontal: 10,
                                    ),
                                    margin: EdgeInsets.only(bottom: 7),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? theme.primary.withValues(alpha: 0.2)
                                          : theme.secondaryFixed,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: AppText(
                                      e.tr(),
                                      textAlign: TextAlign.end,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: theme.onSecondaryFixedVariant,
                                      ).poppinsRegular,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
