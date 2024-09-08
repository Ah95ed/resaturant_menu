import 'package:restaurant_management/Helper/Language/LanguageContrller.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences shpr;
late String path;

class OnRunInit {
  OnRunInit._();
  static final instance = OnRunInit._();
  Future<void> initApp() async {
    // SharedPreferences.setMockInitialValues(<String, String>{});
    shpr = await SharedPreferences.getInstance();
    await initLang(shpr.getString('lang') ?? 'ar');
    path = 'assets/food/food.jpg';
  }
}
