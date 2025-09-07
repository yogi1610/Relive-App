import 'package:flutter/material.dart';
import 'package:relive_app/screens/consultation_add_new_note_screen.dart';
import 'package:relive_app/screens/consultation_chat_screen.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class ConsultationChatListScreen extends StatefulWidget {
  const ConsultationChatListScreen({super.key});

  @override
  State<ConsultationChatListScreen> createState() =>
      _ConsultationChatListScreenState();
}

class _ConsultationChatListScreenState
    extends State<ConsultationChatListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return AppScaffold(
      appBarTitle: AppString.consultation,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          spacing: 15,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                textAlign: TextAlign.right,
                decoration: InputDecoration().suffixIconTextField(
                  contentPadding: const EdgeInsets.all(15),
                  suffix: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: AppImage(
                      imagePath: 'assets/images/svg/ic_search_icon.svg',
                    ),
                  ),
                  hintText: AppString.search,
                  context: context,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AppGestures(
                    onTap: () {
                      CustomNavigator.pushNavigate(
                        context: context,
                        page: ConsultationChatScreen(),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero,
                        color: Color(0xFFFAFAFA),
                      ),
                      child: Row(
                        spacing: 15,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 17,
                            color: theme.onSecondaryFixedVariant,
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 7,
                                children: [
                                  AppText(
                                    (index % 2) == 0 ? 'yesterday' : '7:55 AM',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: theme.onSecondaryFixedVariant,
                                    ).poppinsRegular,
                                  ),
                                  Visibility(
                                    visible: (index % 2) == 0,
                                    child: SvgPicture.asset(
                                      'assets/images/svg/ic_message_read.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 7,
                              children: [
                                AppText(
                                  'Dr. Emma Wilson',
                                  style: TextStyle(fontSize: 16).poppinsMedium,
                                ),
                                AppText(
                                  'We can join meeting tomorrow.',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 12).poppinsRegular,
                                ),
                              ],
                            ),
                          ),
                          ClipOval(
                            child: AppImage(
                              height: 52.h,
                              width: 52.w,
                              imagePath:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy4sWWcwWT5nhSoklq10yQVTiuROLMUeZf6RrLy_q0xOxu-LxkyWzmtg8PnSYmLkIvQPM&usqp=CAU',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            AppGestures(
              onTap: () {
                CustomNavigator.pushNavigate(
                  context: context,
                  page: ConsultationAddNewNoteScreen(),
                );
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: theme.surface,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: theme.primary, width: 1),
                ),
                child: Row(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 25, color: theme.onSurface),
                    AppText(
                      AppString.addNewNote,
                      style: TextStyle(fontSize: 14).poppinsSemiBold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
