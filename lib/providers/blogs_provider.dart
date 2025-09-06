import 'package:relive_app/utils/app_files_imports.dart';

class BlogsProvider extends ChangeNotifier {
  bool _isSortOpen = false;

  bool get isSortOpen => _isSortOpen;

  String _selectedSort = AppString.mostRecent;

  String get selectedSort => _selectedSort;

  List<String> sortList = [AppString.mostRecent, AppString.mostPopular];

  void onTapSortItem(int index) {
    _selectedSort = sortList[index];
    _isSortOpen = false;
    notifyListeners();
  }

  void onTapSort() {
    _isSortOpen = true;
    notifyListeners();
  }
}
