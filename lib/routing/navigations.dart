import 'package:flutter/material.dart';
class ServiceNavigation{

  ServiceNavigation._();

  static ServiceNavigation serviceNavi = ServiceNavigation._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  pushNamedWidget(String name, {String? string , Object? object}) {
    navKey.currentState?.pushNamed(name, arguments: [object, string]);
  }
  pushNamedReplacement(String name){
    navKey.currentState?.pushReplacementNamed(name);
  }

  popFunction() {
    navKey.currentState?.pop();
  }

  pushNamedAndRemoveUtils(String name){
    navKey.currentState?.pushNamedAndRemoveUntil(name, (route) => false);
  }



}