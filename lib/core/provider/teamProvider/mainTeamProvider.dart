import 'package:flutter/cupertino.dart';
import 'package:talants_valley/resources/colorsManager.dart';

class MainTeamProvider extends ChangeNotifier{
  int selectedIndex = 0;
  void onItemTapped(int index) {
      selectedIndex = index;
      notifyListeners();
  }
}