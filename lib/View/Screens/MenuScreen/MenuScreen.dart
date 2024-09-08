import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/CartController.dart';
import 'package:restaurant_management/Helper/Language/Words.dart';
import 'package:restaurant_management/View/Screens/Drawer/CustomDrawer.dart';
import 'package:restaurant_management/View/Screens/MenuScreen/Drinks/DrinksScreen.dart';
import 'package:restaurant_management/View/Screens/MenuScreen/Food/FoodScreen.dart';
import 'package:restaurant_management/View/StyleApp/SizeApp/SizeApp.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final e = context.watch<CartController>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: Scaffoldkey,
        backgroundColor: Colors.yellow.shade100,
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        drawer: const CustomDrawer(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.yellow.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(1, 3),
              ),
            ],
          ),
          height: 40,
          width: context.width / 2,
          child: Center(
            child: Text(
              '${Words.totalPrice} ${e.getAllPriceCart().toString()}',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 4,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Scaffoldkey.currentState!.openDrawer();
            },
            child: const Icon(
              Icons.account_box,
            ),
          ),
          title: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.food_bank), text: Words.foods),
              Tab(icon: Icon(Icons.local_drink), text: Words.drinks),
            ],
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.yellow,
                  Colors.yellow,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            FoodCard(),
            DrinkCard(),
          ],
        ),
      ),
    );
  }
}
