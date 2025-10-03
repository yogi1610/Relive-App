import 'package:flutter/cupertino.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class WellnessProvider extends ChangeNotifier {
  Future<void> blogsApi(BuildContext context) async {
    final blogProvider = Provider.of<BlogsProvider>(context, listen: false);
    await blogProvider.getAllBlogsApi(
      context: context,
      page: 1,
      perPage: 5, // preload only 5 items
    );
  }
}

