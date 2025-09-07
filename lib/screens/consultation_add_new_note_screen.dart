import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class ConsultationAddNewNoteScreen extends StatefulWidget {
  const ConsultationAddNewNoteScreen({super.key});

  @override
  State<ConsultationAddNewNoteScreen> createState() =>
      _ConsultationAddNewNoteScreenState();
}

class _ConsultationAddNewNoteScreenState
    extends State<ConsultationAddNewNoteScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AppScaffold(
      appBarTitle: AppString.addNewNote,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 15,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.practitioner,
                style: TextStyle(fontSize: 16).poppinsMedium,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 25,
                  color: theme.onSecondaryFixedVariant,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: AppText(
                      AppString.selectPractitioner,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.onSecondaryFixedVariant,
                      ).poppinsRegular,
                    ),
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.5, color: theme.outlineVariant),

            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.noteType,
                style: TextStyle(fontSize: 16).poppinsMedium,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 25,
                  color: theme.onSecondaryFixedVariant,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: AppText(
                      'General',
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.onSecondaryFixedVariant,
                      ).poppinsRegular,
                    ),
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.5, color: theme.outlineVariant),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.noteContent,
                style: TextStyle(fontSize: 16).poppinsMedium,
              ),
            ),
            TextFormField(
              textAlign: TextAlign.right,
              minLines: 5,
              maxLines: null,
              decoration: InputDecoration().defaultTextField(
                hintText: '',
                context: context,
                borderRadius: 15,
                borderColor: theme.outlineVariant,
                backgroundColor: theme.surface,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: AppText(
                    AppString.markAsImportant,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.onSecondaryFixedVariant,
                    ).poppinsLight,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 35,
                  child: Checkbox(
                    value: isCheck,
                    onChanged: (value) {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        3,
                      ), // circular corners
                    ),
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Theme.of(
                          context,
                        ).colorScheme.primary; // checked color
                      }
                      return Colors.transparent; // unchecked background
                    }),
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      // outline color
                      width: 2,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 15),
              child: AppText(
                AppString.attachments,
                style: TextStyle(fontSize: 16).poppinsMedium,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: theme.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: theme.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  AppImage(imagePath: 'assets/images/svg/ic_upload_icon.svg'),
                  AppText(
                    AppString.clickToUpload,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.onSecondaryFixedVariant,
                    ).poppinsMedium,
                  ),
                  AppText(
                    AppString.attachmentInfo,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.onSecondaryFixedVariant,
                    ).poppinsLight,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
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
        ),
      ),
    );
  }
}
