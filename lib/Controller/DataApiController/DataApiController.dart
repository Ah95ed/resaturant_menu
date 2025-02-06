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

  Map<String, dynamic> sendOrders = {};
  List order = [];
  bool isSend = false;
  List pr = [];
  Future<void> sendOrder(String number, double lang, double lat) async {
    if (carts.isEmpty) return;
    for (int i = 0; i < carts.length; i++) {
      order.add('${carts[i].name}-${carts[i].price}');
      pr.add(carts[i].quantity);
    }

    sendOrders = {
      'ch': order,
      'pr': pr,
      'allprice': getAllPriceCart(),
      'tel': number,
      'info': 'info',
      'deliver': 'deliver',
      'lat': '$lat',
      'longg': '$lang',
      'nmtable': 'nmtable',
    };

    isSend = await _apiModel.sendOrder(sendOrders);
    if (isSend) {
      carts.clear();
      pr.clear();
      order.clear();
      data.clear();
      isSend = false;
      notifyListeners();
      return;
    }
    notifyListeners();
  }

  List<Cartmodels> carts = [];

  void addToCart(Cartmodels product) async {
    // تحقق مما إذا كان المنتج موجودًا بالفعل في السلة
    int index = carts.indexWhere(
      (item) => item.name == product.name,
    );
    if (index != -1) {
      // إذا كان المنتج موجودًا، قم بزيادة العدد وتحديث السعر الإجمالي
      carts[index].quantity += product.quantity;
      carts[index].price += product.price;
    } else {
      // إذا لم يكن المنتج موجودًا، أضفه للسلة
      carts.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(int index) async {
    carts.removeAt(index);
    notifyListeners();
  }

  void removeCountFromCart(Cartmodels product) {
    // تحقق مما إذا كان المنتج موجودًا في السلة
    int index = carts.indexWhere(
      (item) => item.name == product.name,
    );

    if (index != -1) {
      // إذا كان المنتج موجودًا، قم بإنقاص العدد وتحديث السعر
      carts[index].quantity -= product.quantity;
      carts[index].price -= product.price;

      // إذا وصل العدد إلى الصفر أو أقل، احذف المنتج من السلة
      if (carts[index].quantity <= 0) {
        carts.removeAt(index);
      }
    }
    notifyListeners();
  }

  double getAllPriceCart() {
    double total = 0.0;
    for (int i = 0; i < carts.length; i++) {
      total += carts[i].price; //* carts[i].quantity;
    }
    return total;
  }
}
