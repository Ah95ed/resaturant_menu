import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:restaurant_management/Helper/Language/LanguageContrller.dart';
import 'package:restaurant_management/Helper/Language/Words.dart';
import 'package:restaurant_management/Helper/Location/LocationClint.dart';
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Models/ApiModel/ApiModel.dart';
import 'package:restaurant_management/Models/CartModels.dart';

class DataApiController extends ChangeNotifier {
  late ApiModel _apiModel;

  static final DataApiController instance = DataApiController();

  DataApiController() {
    _apiModel = ApiModel();
    getData();
  }
  Map<String, dynamic> data = {};
  List foods = [];
  List drinks = [];

  Future<void> getData() async {
    data = await _apiModel.getData();

    for (var e in data['data']) {
      if (e['sngl'] == Words.drink) {
        drinks.add(e);
      } else {
        foods.add(e);
      }
    }

    notifyListeners();
  }

  Map<String, List> sendOrders = {};
  List order = [];
  // $numbertable=$_POST['nmtable'];
// $kbabhalf=$_POST['ch'];
// $count=$_POST['pr'];
// $allprice=$_POST['allprice'];
// $tel=$_POST['tel'];
// $info=$_POST['info'];
// $deliver=$_POST['deliver'];

// $lat = $_POST["lat"];
// $longt = $_POST["longg"];
  Future<void> sendOrder() async {
    if (carts.isEmpty) return;

    // Position position = await LocationClient.instanse.getCurrentLocation();

    for (int i = 0; i < carts.length; i++) {
      sendOrders = {
        'ch': [carts[i].name, carts[i].price,],
        'pr': [ carts[i].quantity],
        'allprice': [getAllPriceCart()],
        'tel': ['0000'],
        'info': ['info'],
        'deliver': ['deliver'],
        'lat': ['lat'],
        'longg': ['long'],
        'nmtable' : ['nmtable'],
      };
      order.add({
        'ch': [carts[i].name, carts[i].price, carts[i].quantity],
          'pr': [getAllPriceCart().toString()],
        'allprice': [getAllPriceCart()],
        'tel': ['0000'],
        'info': ['info'],
        'deliver': ['deliver'],
        'lat': ['lat'],
        'longg': ['long'],
        'nmtable' : ['nmtable'],
      });
    }
    _apiModel.sendOrder(sendOrders);
  }

  List carts = [];

  void addToCart(Cartmodels product) async {
    carts.add(product);
    notifyListeners();
  }

  void removeFromCart(int index) async {
    carts.removeAt(index);
    notifyListeners();
  }

  double getAllPriceCart() {
    double total = 0.0;
    for (int i = 0; i < carts.length; i++) {
      total += carts[i].price * carts[i].quantity;
    }
    return total;
  }
}




// $numbertable=$_POST['nmtable'];
// $kbabhalf=$_POST['ch'];

// $count=$_POST['pr'];

// $allprice=$_POST['allprice'];

// $tel=$_POST['tel'];
// $info=$_POST['info'];
// $deliver=$_POST['deliver'];

// $lat = $_POST["lat"];
// $longt = $_POST["longg"];