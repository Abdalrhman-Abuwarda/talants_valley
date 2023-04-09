import 'package:flutter/cupertino.dart';
import 'package:talants_valley/resources/colors_manager.dart';

class MainTeamProvider extends ChangeNotifier{
  int selectedIndex = 0;
  void onItemTapped(int index) {
      selectedIndex = index;
      notifyListeners();
  }
}