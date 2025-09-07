import 'package:flutter/material.dart';
import 'package:relive_app/providers/add_new_appointment_provider.dart';

import '../utils/app_files_imports.dart';

class AddNewAppointmentScreen extends StatefulWidget {
  const AddNewAppointmentScreen({super.key});

  @override
  State<AddNewAppointmentScreen> createState() =>
      _AddNewAppointmentScreenState();
}

class _AddNewAppointmentScreenState extends State<AddNewAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AppScaffold(
      appBarTitle: AppString.newAppointment,
      body: Consumer<AddNewAppointmentProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Column(
                    spacing: 15,
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: AppText(
                          AppString.date,
                          style: TextStyle(fontSize: 16).poppinsSemiBold,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/svg/ic_bnb_meetings.svg',
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              spacing: 10,
                              children: [
                                Flexible(
                                  child: AppText(
                                    'mm/dd/yyyy',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.onSecondaryFixedVariant,
                                    ).poppinsRegular,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/images/svg/ic_bnb_meetings.svg',
                                  colorFilter: ColorFilter.mode(
                                    theme.onSecondaryFixedVariant.withValues(
                                      alpha: 0.2,
                                    ),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _divider(),

                      Container(
                        alignment: Alignment.topRight,
                        child: AppText(
                          AppString.time,
                          style: TextStyle(fontSize: 16).poppinsSemiBold,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/svg/ic_clock.svg'),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              spacing: 10,
                              children: [
                                Flexible(
                                  child: AppText(
                                    '-- : -- --',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.onSecondaryFixedVariant,
                                    ).poppinsRegular,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/images/svg/ic_clock.svg',
                                  colorFilter: ColorFilter.mode(
                                    theme.onSecondaryFixedVariant.withValues(
                                      alpha: 0.2,
                                    ),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _divider(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          // ============ Practitioner ============
                          Align(
                            alignment: Alignment.topRight,
                            child: AppText(
                              AppString.practitioner,
                              style: TextStyle(fontSize: 16).poppinsMedium,
                            ),
                          ),
                          AppGestures(
                            onTap: provider.onTapPractitioner,
                            child: Row(
                              children: [
                                Icon(
                                  provider.isPractitionerDropdownOpen
                                      ? Icons.keyboard_arrow_up_sharp
                                      : Icons.keyboard_arrow_down_sharp,
                                  size: 25,
                                  color: theme.onSecondaryFixedVariant,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: AppText(
                                      provider.selectedPractitioner,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: theme.onSecondaryFixedVariant,
                                      ).poppinsRegular,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (provider.isPractitionerDropdownOpen)
                            Container(
                              margin: EdgeInsets.only(top: 8, bottom: 15),
                              padding: EdgeInsets.all(10),
                              constraints: BoxConstraints(maxHeight: 135.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: provider.practitionerList.map((e) {
                                    final isSelected = e == provider.selectedPractitioner;
                                    return AppGestures(
                                      onTap: () {
                                        provider.onTapPractitionerItem(
                                          provider.practitionerList.indexOf(e),
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
                          _divider(),

                          // ============ Appointment Type ============
                          Align(
                            alignment: Alignment.topRight,
                            child: AppText(
                              AppString.appointmentType,
                              style: TextStyle(fontSize: 16).poppinsMedium,
                            ),
                          ),
                          AppGestures(
                            onTap: provider.onTapAppointmentType,
                            child: Row(
                              children: [
                                Icon(
                                  provider.isAppointmentTypeDropdownOpen
                                      ? Icons.keyboard_arrow_up_sharp
                                      : Icons.keyboard_arrow_down_sharp,
                                  size: 25,
                                  color: theme.onSecondaryFixedVariant,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: AppText(
                                      provider.selectedAppointmentType,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: theme.onSecondaryFixedVariant,
                                      ).poppinsRegular,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (provider.isAppointmentTypeDropdownOpen)
                            Container(
                              margin: EdgeInsets.only(top: 8, bottom: 15),
                              padding: EdgeInsets.all(10),
                              constraints: BoxConstraints(maxHeight: 135.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: provider.appointmentTypeList.map((e) {
                                    final isSelected = e == provider.selectedAppointmentType;
                                    return AppGestures(
                                      onTap: () {
                                        provider.onTapAppointmentTypeItem(
                                          provider.appointmentTypeList.indexOf(e),
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
                          _divider(),
                        ],
                      )

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  spacing: 15,
                  children: [
                    Expanded(
                      child: AppButton(
                        btnHeight: 50.h,
                        onPressed: () {},
                        buttonColor: theme.surface,
                        borderColor: theme.primary,
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: theme.onSurface,
                        ).poppinsMedium,
                        name: AppString.cancel,
                      ),
                    ),
                    Expanded(
                      child: AppButton(
                        btnHeight: 50.h,
                        onPressed: () {},
                        buttonColor: theme.primary.withValues(alpha: 0.3),
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: theme.primary,
                        ).poppinsMedium,
                        name: AppString.save,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _divider() {
    return Divider(thickness: 1, color: Color(0xFFD2F1F3));
  }
}
