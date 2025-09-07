import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relive_app/screens/consultation_add_new_note_screen.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class ConsultationChatScreen extends StatefulWidget {
  const ConsultationChatScreen({super.key});

  @override
  State<ConsultationChatScreen> createState() => _ConsultationChatScreenState();
}

class _ConsultationChatScreenState extends State<ConsultationChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return AppScaffold(
      appBarTitle: 'Chat with Dr. Emma',
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: theme.surface,
                  borderRadius: BorderRadius.circular(20),
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
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.grey[200],
                            child: ClipOval(
                              child: AppImage(
                                imagePath:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy4sWWcwWT5nhSoklq10yQVTiuROLMUeZf6RrLy_q0xOxu-LxkyWzmtg8PnSYmLkIvQPM&usqp=CAU",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Dr. Emma Wilson",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Active now",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                    size: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1.5, color: theme.outlineVariant),

                    // Chat body
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(12),
                        children: [
                          _buildMessage(
                            "Hi, Doctor. I’ve been feeling really tired lately.",
                            "4.32 PM",
                            false,
                          ),
                          _buildMessage(
                            "How long has this been happening?",
                            "4.33 PM",
                            true,
                          ),
                          _buildMessage(
                            "About two weeks now. I feel drained even after sleeping.",
                            "4.34 PM",
                            false,
                          ),
                          _buildMessage(
                            "Any other symptoms? Headaches, fever, or body aches?",
                            "4.35 PM",
                            true,
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1.5, color: theme.outlineVariant),
                    // Input bar
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          _chatButton(
                            onTap: () {},
                            icon: 'assets/images/svg/ic_send_message.svg',
                          ),

                          Expanded(
                            child: Container(
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: theme.secondaryContainer,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      spacing: 10,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svg/ic_send_attachment.svg',
                                          height: 20.h,
                                          width: 20.w,
                                        ),

                                        SvgPicture.asset(
                                          'assets/images/svg/ic_camera.svg',
                                          height: 20.h,
                                          width: 20.w,
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/svg/ic_chat_mic.svg',
                                          height: 20.h,
                                          width: 20.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration()
                                          .defaultTextField(
                                            context: context,
                                            hintText: AppString.enterMessage,
                                            backgroundColor:
                                                theme.secondaryContainer,
                                            borderColor:
                                                theme.secondaryContainer,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 15,
                                                ),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

  Widget _chatButton({required VoidCallback onTap, required String icon}) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: 50.h,
      width: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.secondaryContainer,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(icon, height: 20.h, width: 20.w),
    );
  }

  Widget _buildMessage(String text, String time, bool isDoctor) {
    return Align(
      alignment: isDoctor ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: isDoctor
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDoctor
                    ? Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.1)
                    : Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(text, style: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
