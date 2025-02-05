import 'package:restaurant_management/Helper/Language/LanguageContrller.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences shpr;

class OnRunInit {
  OnRunInit._();
  static final instance = OnRunInit._();
  Future<void> initApp() async {
    shpr = await SharedPreferences.getInstance();
    await initLang(shpr.getString('lang') ?? 'ar');
  }
}
