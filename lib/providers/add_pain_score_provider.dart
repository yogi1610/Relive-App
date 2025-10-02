import 'package:flutter/cupertino.dart';

import '../utils/app_files_imports.dart';

class AddPainScoreProvider extends ChangeNotifier {
  int painScore = 5;

  void onChangePainScore(int value) {
    painScore = value;
  }

  TextEditingController feedbackController = TextEditingController();
  String? feedBack;

  void onTapAddFeedback(BuildContext context) {
    ShowPopUp.dialogueBox(context: context, body: AddFeedbackDialogue());
  }

  void onSaveFeedback(BuildContext context) {
    feedBack = feedbackController.text.toString();
    notifyListeners();
    Navigator.pop(context);
  }

  void onClearFeedBack() {
    feedBack = null;
    feedbackController.clear();
    notifyListeners();
  }

  /// Pick image from gallery

  File? pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> onTapClickToUpload() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage = File(image.path);
      notifyListeners();
    }
  }

  void clearImage(){
    pickedImage = null;
    notifyListeners();
  }

  Future<void> addPainScoreApi({required BuildContext context}) async {
    if (context.mounted) {
      AppUtils.progressLoadingDialog(context, true);
    }
    Map<String, String> body = {};
    body[ApiKeys.painScore] = painScore.toString();
    if (feedBack != null) {
      body[ApiKeys.notes] = feedBack.toString();
    }
    List<MultipartFile> files = [];
    if (pickedImage != null) {
      files.add(
        await MultipartFile.fromFile(
          pickedImage!.path,
          filename: pickedImage!.path.split('/').last,
        ),
      );
    }
    var jsonResponse = await Apis.storePatientPainScore(
      body: body,
      files: files,
      mapKeyFile: ApiKeys.image,
      onProgress: (x, y) {},
    );
    if (context.mounted) {
      AppUtils.progressLoadingDialog(context, false);
    }
    if (jsonResponse[AppConstants.apiStatus] == true) {
      if (context.mounted) {
        _onAddPainScoreSuccess(context);
      }
    } else {
      AppMessage.error(jsonResponse[AppConstants.apiMessage]);
    }
  }

  void _onAddPainScoreSuccess(BuildContext context) {
    ShowPopUp.dialogueBox(context: context, body: PainScoreSuccessDialogue());
    feedBack = null;
    painScore = 5; //default
    feedbackController.clear();
    pickedImage = null;
    notifyListeners();
  }
}
