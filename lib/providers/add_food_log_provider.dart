import 'package:relive_app/utils/app_files_imports.dart';

class AddFoodLogProvider extends ChangeNotifier {
  bool _isUnitDropdownOpen = false;

  bool get isUnitDropdownOpen => _isUnitDropdownOpen;

  String _selectedUnit = 'Grams';

  String get selectedUnit => _selectedUnit;

  List<String> unitList = ['Grams', 'Slices', 'Cups', 'Ounces', 'Servings'];

  void onTapUnitItem(int index) {
    _selectedUnit = unitList[index];
    _isUnitDropdownOpen = false;
    notifyListeners();
  }

  void onTapUnit() {
    _isUnitDropdownOpen = true;
    notifyListeners();
  }
}
