import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final AppointmentList appointment;

  const AppointmentDetailsScreen({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentProvider>(context);
    return AppScaffold(
      appBarTitle: AppString.appointmentDetails,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                spacing: 15,
                children: [
                  AppGestures(
                    onTap: () => provider.onTapAppointmentDelete(
                      context: context,
                      appointmentId: appointment.id.toString(),
                    ),
                    child: SvgPicture.asset('assets/images/svg/ic_delete.svg'),
                  ),
                  AppGestures(
                    onTap: () {
                      CustomNavigator.pushNavigate(
                        context: context,
                        page: AppointmentEditScreen(appointment: appointment),
                        hitApi: (val) {
                          if (val != null && val == true) {
                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                    child: SvgPicture.asset('assets/images/svg/ic_edit.svg'),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        spacing: 7,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText(
                            'John Smith',
                            style: TextStyle(fontSize: 14).poppinsSemiBold,
                          ),

                          AppText(
                            appointTypeInfo(
                              appointment.appointmentType,
                            )['type'],
                            style: TextStyle(
                              fontSize: 12,
                              color: appointTypeInfo(
                                appointment.appointmentType,
                              )['color'],
                            ).poppinsRegular,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipOval(
                    child: AppImage(
                      imagePath:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy4sWWcwWT5nhSoklq10yQVTiuROLMUeZf6RrLy_q0xOxu-LxkyWzmtg8PnSYmLkIvQPM&usqp=CAU',
                      height: 50.h,
                      width: 50.w,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 15),
              child: _infoWidget(
                context: context,
                title: AppString.date,
                value: AppDateOrTimeFormat.formatToHumanReadable(
                  appointment.appointmentDate,
                ),
              ),
            ),

            _infoWidget(
              context: context,
              title: AppString.time,
              value: AppDateOrTimeFormat.formatTime12Hour(
                appointment.startTime,
              ),
            ),

            _infoWidget(
              context: context,
              title: AppString.practitioner,
              value: 'Dr. Wilson',
            ),

            Visibility(
              visible: appointment.notes != null,
              child: _infoWidget(
                context: context,
                title: 'Notes',
                value: appointment.notes.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoWidget({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppText(
          title,
          style: TextStyle(
            fontSize: 14,
            color: theme.onSecondaryFixedVariant,
          ).poppinsRegular,
        ),
        AppText(
          value,
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 16).poppinsMedium,
        ),
      ],
    );
  }
}

class DeleteAppointmentDialogue extends StatelessWidget {
  const DeleteAppointmentDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        spacing: 15,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppGestures(
              onTap: () => Navigator.of(context).pop(false),
              child: AppImage(imagePath: 'assets/images/svg/ic_close_icon.svg'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: AppText(
              AppString.deleteAppointmentConfirm,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16).poppinsSemiBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              spacing: 15,
              children: [
                Expanded(
                  child: AppButton(
                    btnHeight: 50.h,
                    onPressed: () => Navigator.of(context).pop(false),
                    borderColor: theme.primary,
                    buttonColor: theme.surface,
                    name: AppString.cancel,
                    textStyle: TextStyle(fontSize: 14).poppinsSemiBold,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    name: AppString.save,
                    buttonColor: theme.primary.withValues(alpha: 0.2),
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: theme.primary,
                    ).poppinsSemiBold,
                    btnHeight: 50.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
