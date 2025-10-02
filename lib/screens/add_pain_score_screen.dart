import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class AddPainScoreScreen extends StatelessWidget {
  const AddPainScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<AddPainScoreProvider>(context);
    return AppScaffold(
      appBarTitle: AppString.painScore,
      bottomSafeArea: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          spacing: 15,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Visibility(
                visible: provider.feedBack == null,
                replacement: Stack(
                  children: [
                    AppGestures(
                      onTap: () => provider.onTapAddFeedback(context),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 5, left: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: theme.outlineVariant,
                            width: 1,
                          ),
                        ),
                        child: AppText(
                          provider.feedBack.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 13).poppinsRegular,
                        ),
                      ),
                    ),
                    AppGestures(
                      onTap: () => provider.onClearFeedBack(),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: AppColors.colorRed,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 20,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                child: AppGestures(
                  onTap: () => provider.onTapAddFeedback(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        Icon(Icons.add, color: theme.primary, size: 25),
                        AppText(
                          AppString.addFeedback,
                          style: TextStyle(fontSize: 14).poppinsMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.enterPainScore,
                style: TextStyle(
                  fontSize: 14,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsRegular,
              ),
            ),
            NumberPickerCustom(
              initialValue: 5,
              onValueChanged: (value) => provider.onChangePainScore(value),
            ),
            Align(
              alignment: Alignment.topRight,
              child: AppText(
                AppString.uploadPhotos,
                style: TextStyle(
                  fontSize: 18,
                  color: theme.onSecondaryFixedVariant,
                ).poppinsSemiBold,
              ),
            ),
            AppGestures(
              onTap: () => provider.onTapClickToUpload(),
              child: Visibility(
                visible: provider.pickedImage == null,
                replacement: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7, left: 7),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(14),
                        child: AppImage(
                          imagePath: provider.pickedImage?.path ?? '',
                          height: 225,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    AppGestures(
                      onTap: () => provider.clearImage(),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: AppColors.colorRed,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 20,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ),
                  ],
                ),
                child: Container(
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
                    spacing: 12,
                    children: [
                      AppImage(
                        imagePath: 'assets/images/svg/ic_upload_icon.svg',
                      ),
                      AppText(
                        AppString.clickToUpload,
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.onSecondaryFixedVariant,
                        ).poppinsMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            AppButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              onPressed: () => provider.addPainScoreApi(context: context),
              name: AppString.continueText,
            ),
          ],
        ),
      ),
    );
  }
}

class AddFeedbackDialogue extends StatelessWidget {
  const AddFeedbackDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final provider = Provider.of<AddPainScoreProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        spacing: 15,
        children: [
          Row(
            children: [
              AppGestures(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AppImage(
                  imagePath: 'assets/images/svg/ic_close_icon.svg',
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: AppText(
                    AppString.feedback,
                    style: TextStyle(fontSize: 18).poppinsSemiBold,
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: provider.feedbackController,
            textAlign: TextAlign.right,
            maxLines: null,
            minLines: 4,
            decoration: InputDecoration().defaultTextField(
              hintText: AppString.addNotes,
              contentPadding: EdgeInsets.all(10),
              context: context,
              borderRadius: 10,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    borderColor: theme.primary,
                    buttonColor: theme.surface,
                    name: AppString.cancel,
                    textStyle: TextStyle(fontSize: 14).poppinsSemiBold,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onPressed: () => provider.onSaveFeedback(context),
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

class PainScoreSuccessDialogue extends StatelessWidget {
  const PainScoreSuccessDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        spacing: 15,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppGestures(
              onTap: () {
                Navigator.pop(context);
              },
              child: AppImage(imagePath: 'assets/images/svg/ic_close_icon.svg'),
            ),
          ),
          Icon(
            Icons.check_circle,
            size: 125.h,
            color: Theme.of(context).colorScheme.primary,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: AppText(
              AppString.pinScoreSubmitted,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
                fontSize: 14,
              ).poppinsRegular,
            ),
          ),
        ],
      ),
    );
  }
}
