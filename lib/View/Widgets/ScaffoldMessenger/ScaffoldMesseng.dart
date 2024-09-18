import 'package:flutter/material.dart';


class Scaffoldmesseng {
  static final Scaffoldmesseng _instance = Scaffoldmesseng._();
  Scaffoldmesseng._();

  factory Scaffoldmesseng() {
    return _instance;
  }
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}