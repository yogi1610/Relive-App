import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class WellnessNutritionAddFoodLogScreen extends StatefulWidget {
  const WellnessNutritionAddFoodLogScreen({super.key});

  @override
  State<WellnessNutritionAddFoodLogScreen> createState() =>
      _WellnessNutritionAddFoodLogScreenState();
}

class _WellnessNutritionAddFoodLogScreenState
    extends State<WellnessNutritionAddFoodLogScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      appBarTitle: AppString.logFood,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Consumer<AddFoodLogProvider>(
          builder: (context, provider, _) {
            return Column(
              spacing: 15,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: AppText(
                    AppString.foodName,
                    style: TextStyle(fontSize: 16).poppinsMedium,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: AppText(
                    'Suchi, Chicken, Rice Bowl',
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
                      spacing: 10,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            spacing: 15,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  spacing: 7,
                                  children: [
                                    AppText(
                                      AppString.unit,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ).poppinsMedium,
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                      child: TextFormField(
                                        textAlign: TextAlign.right,
                                        readOnly: true,
                                        onTap: provider.onTapUnit,
                                        controller: TextEditingController(
                                          text: provider.selectedUnit.tr(),
                                        ),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: theme.onSecondaryFixedVariant,
                                        ).poppinsRegular,
                                        decoration: InputDecoration()
                                            .prefixIconTextField(
                                              hintText: '',
                                              prefixIcon: Icon(
                                                provider.isUnitDropdownOpen
                                                    ? Icons
                                                          .keyboard_arrow_up_sharp
                                                    : Icons
                                                          .keyboard_arrow_down_sharp,
                                                size: 25,
                                              ),
                                              context: context,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                              borderRadius: 10,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  spacing: 7,
                                  children: [
                                    AppText(
                                      AppString.portionSize,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ).poppinsMedium,
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                      child: TextFormField(
                                        textAlign: TextAlign.right,
                                        decoration: InputDecoration()
                                            .defaultTextField(
                                              hintText: 'e.g 150',
                                              prefixIcon: Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                size: 25,
                                              ),
                                              context: context,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                              borderRadius: 10,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            color: theme.primary.withValues(alpha: 0.1),
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
                            spacing: 15,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: AppText(
                                  AppString.nutritionalInformation,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ).poppinsSemiBold,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: AppText(
                                  'Calories (kcal)',
                                  style: TextStyle(fontSize: 16).poppinsMedium,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  height: 40.h,
                                  width: 185.w,
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration()
                                        .prefixIconTextField(
                                          hintText: 'e.g 150',
                                          prefixIcon: Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 25,
                                          ),
                                          context: context,
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          borderRadius: 10,
                                        ),
                                  ),
                                ),
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      spacing: 7,
                                      children: [
                                        AppText(
                                          '${AppString.fat} (G)',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ).poppinsMedium,
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                          child: TextFormField(
                                            textAlign: TextAlign.right,
                                            decoration: InputDecoration()
                                                .defaultTextField(
                                                  hintText: 'e.g 100',
                                                  context: context,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                      ),
                                                  borderRadius: 10,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      spacing: 7,
                                      children: [
                                        AppText(
                                          '${AppString.carbs} (G)',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ).poppinsMedium,
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                          child: TextFormField(
                                            textAlign: TextAlign.right,
                                            decoration: InputDecoration()
                                                .defaultTextField(
                                                  hintText: 'e.g 100',
                                                  prefixIcon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_sharp,
                                                    size: 25,
                                                  ),
                                                  context: context,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                      ),
                                                  borderRadius: 10,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      spacing: 7,
                                      children: [
                                        AppText(
                                          '${AppString.protein} (G)',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ).poppinsMedium,
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                          child: TextFormField(
                                            textAlign: TextAlign.right,
                                            decoration: InputDecoration()
                                                .defaultTextField(
                                                  hintText: 'e.g 100',
                                                  prefixIcon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_sharp,
                                                    size: 25,
                                                  ),
                                                  context: context,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                      ),
                                                  borderRadius: 10,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (provider.isUnitDropdownOpen)
                      Positioned(
                        top: 85.h,
                        left: 0,
                        right: 190.w,
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
                              children: provider.unitList.map((e) {
                                final isSelected = e == provider.selectedUnit;
                                return AppGestures(
                                  onTap: () {
                                    provider.onTapUnitItem(
                                      provider.unitList.indexOf(e),
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

                Align(
                  alignment: Alignment.topRight,
                  child: AppText(
                    AppString.notesOptional,
                    style: TextStyle(fontSize: 16).poppinsMedium,
                  ),
                ),
                TextFormField(
                  textAlign: TextAlign.right,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration().defaultTextField(
                    hintText: '',
                    context: context,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    borderRadius: 10,
                  ),
                ),

                AppButton(
                  btnHeight: 54.h,
                  padding: EdgeInsets.only(top: 30),
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: theme.surface,
                  ).poppinsMedium,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  name: AppString.addToDailyLog,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
