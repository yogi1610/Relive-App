import 'package:flutter/material.dart';

import '../utils/app_files_imports.dart';

class NutritionLogWeightPopup extends StatefulWidget {
  const NutritionLogWeightPopup({super.key});

  @override
  State<NutritionLogWeightPopup> createState() => _NutritionLogWeightPopupState();
}

class _NutritionLogWeightPopupState extends State<NutritionLogWeightPopup> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        spacing: 15,
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AppGestures(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppImage(
                    imagePath: 'assets/images/svg/ic_close_icon.svg',
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: AppText(
                    AppString.logWeight,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16).poppinsSemiBold,
                  ),
                ),
              ),
            ],
          ),
          TextFormField(
            textAlign: TextAlign.right,
            decoration: InputDecoration().defaultTextField(
              hintText: AppString.typeHere,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              borderRadius: 10,
              context: context,
              borderColor: theme.outlineVariant,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
