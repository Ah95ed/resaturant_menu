import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Models/ApiModel/ApiModel.dart';

class DataApiController extends ChangeNotifier {
  late ApiModel _apiModel;

  static DataApiController instance = DataApiController();

  DataApiController() {
    log('message init DataApiController');
    _apiModel = ApiModel();
    getData();
  }

  Future<void> getData() async {
    Logger.l('message getData DataApiController');
    await _apiModel.getData();
    notifyListeners();
  }
}
