import 'package:flutter/material.dart';
import 'package:restaurant_management/View/Screens/MenuScreen/MenuScreen.dart';


  const initRoute = '/';



Map<String, Widget Function(BuildContext)> routes = {

  initRoute: (context) =>  MenuScreen(),

};
