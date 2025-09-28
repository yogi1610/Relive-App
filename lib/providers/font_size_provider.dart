import 'package:flutter/cupertino.dart';
import 'package:relive_app/constants/app_strings.dart';
import 'package:relive_app/utils/app_storage.dart';

class FontSizeProvider extends ChangeNotifier {
  static const String _key = "font_scale_index";

  final List<FontSizeModel> _fontSize = [
    FontSizeModel(type: AppString.fontDefault, scale: 1.0),
    FontSizeModel(type: AppString.fontSmaller, scale: 0.9),
    FontSizeModel(type: AppString.fontMedium, scale: 1.1),
    FontSizeModel(type: AppString.fontLarger, scale: 1.2),
  ];

  List<FontSizeModel> get fontSize => _fontSize;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  double get scale => _fontSize[_selectedIndex].scale;

  FontSizeProvider() {
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    _selectedIndex = await AppStorageManager.readData(_key) ?? 0;
    notifyListeners();
  }

  Future<void> onSelectFontSize(int index) async {
    _selectedIndex = index;
    AppStorageManager.saveData(_key, _selectedIndex);
    notifyListeners();
  }
}

class FontSizeModel {
  String type;
  double scale;

  FontSizeModel({required this.type, required this.scale});
}
