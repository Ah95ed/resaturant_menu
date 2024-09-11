import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/CartController.dart';
import 'package:restaurant_management/Controller/DataApiController/DataApiController.dart';
import 'package:restaurant_management/Helper/EngineInitialization/EngineInitialization.dart';
import 'package:restaurant_management/Helper/Language/LanguageContrller.dart';
import 'package:restaurant_management/Helper/Language/Words.dart';
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Helper/Service/onRunInit.dart';
import 'package:restaurant_management/View/Screens/MenuScreen/MenuScreen.dart';
import 'package:restaurant_management/View/route/route.dart';

void main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await OnRunInit.instance.initApp();
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LanguageController(),
              lazy: false,
            ),
            ChangeNotifierProvider(
              create: (_) => CartController(),
              lazy: true,
            ),
            ChangeNotifierProvider.value(value: DataApiController.instance),
            
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stackTrace) {
      Logger.l('runZonedGuarded $error + $stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageController>(
      builder: (context, value, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          supportedLocales: value.supportLanguage,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          locale: value.currentLocale,
          initialRoute: initRoute,
          routes: routes,
          home: MyHomePage(),
        );
      },
    );
  }
}
