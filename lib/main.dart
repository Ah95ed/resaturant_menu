import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/DataApiController/DataApiController.dart';
import 'package:restaurant_management/Helper/Language/LanguageContrller.dart';
import 'package:restaurant_management/Helper/Language/Words.dart';
import 'package:restaurant_management/Helper/Location/LocationClint.dart';
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Helper/Service/onRunInit.dart';
import 'package:restaurant_management/View/Screens/MenuScreen/MenuScreen.dart';
import 'package:restaurant_management/View/route/route.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await OnRunInit.instance.initApp();
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => LanguageController(),
              lazy: true,
            ),
            ChangeNotifierProvider.value(value: DataApiController()),
          ],
          child: const MyApp(),
        ),
      );
    },
    (error, stackTrace) {
      Logger.l('runZonedGuarded ==== $error + $stackTrace');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageController>(
      builder: (context, value, child) {
        return MaterialApp(
          supportedLocales: value.supportLanguage,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          locale: value.currentLocale,
          title:Lang[Words.appName],
          initialRoute: initRoute,
          routes: routes,
        );
      },
    );
  }
}
