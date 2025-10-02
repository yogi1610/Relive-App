import 'package:flutter/material.dart';
import 'package:relive_app/utils/app_files_imports.dart';

class BlogsProvider extends ChangeNotifier {
  bool _isSortOpen = false;

  bool get isSortOpen => _isSortOpen;

  String _selectedSort = AppString.mostRecent;

  String get selectedSort => _selectedSort;

  List<String> sortList = [AppString.mostRecent, AppString.mostPopular];

  List<BlogsList> blogsList = [];

  void onTapSortItem(int index) {
    _selectedSort = sortList[index];
    _isSortOpen = false;
    notifyListeners();
  }

  void onTapSort() {
    _isSortOpen = true;
    notifyListeners();
  }

  Future<void> getAllBlogsApi({
    required BuildContext context,
    required int page,
    required int perPage,
    String? search,
    String? filter,
  }) async {
    Map<String, String> body = {};
    body[ApiKeys.page] = page.toString();
    body[ApiKeys.perPage] = perPage.toString();
    if (search != null) {
      body[ApiKeys.searchKey] = search;
    }
    if (filter != null) {
      body[ApiKeys.filter] = filter;
    }
    final response = await Apis.getAllBlogs(body: {});
    if (response != null && response.status) {
      blogsList = response.data.blogs;
    } else {
      blogsList = [];
    }
    notifyListeners();
  }
}
