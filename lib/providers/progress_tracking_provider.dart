import 'package:flutter/cupertino.dart';

class ProgressReportProvider extends ChangeNotifier{

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  onTabChanged(int index){
    _selectedTabIndex = index;
    notifyListeners();
  }
}