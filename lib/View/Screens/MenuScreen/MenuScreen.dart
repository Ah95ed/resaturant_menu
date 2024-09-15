import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/DataApiController/DataApiController.dart';
import 'package:restaurant_management/Helper/Language/LanguageContrller.dart';
import 'package:restaurant_management/Helper/Language/Words.dart';
import 'package:restaurant_management/Models/ApiModel/ApiModel.dart';
import 'package:restaurant_management/View/Drawer/CustomDrawer.dart';
import 'package:restaurant_management/View/Screens/MenuScreen/Drinks/DrinksScreen.dart';
import 'package:restaurant_management/View/Screens/MenuScreen/Food/FoodScreen.dart';
import 'package:restaurant_management/View/StyleApp/SizeApp/SizeApp.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final c = context.read<DataApiController>();
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
            boxShadow: const [
              BoxShadow(
                color: Colors.yellow,
                // spreadRadius: 5,
                // blurRadius: 7,
                // offset: Offset(1, 3),
              ),
            ],
          ),
          height: context.setHeight(4.5),
          width: context.width / 2,
          child: Consumer<DataApiController>(
            builder: (context, e, child) {
              return Center(
                child: Text(
                  '${Words.totalPrice} ${e.getAllPriceCart()}',
                  style: const TextStyle(color: Colors.black),
                ),
              );
            },
          ),
        ),
        appBar: AppBar(
          elevation: 4,
          centerTitle: true,
          leading: Consumer<DataApiController>(
            builder: (context, value, child) => Stack(
              children: [
                Positioned(
                    child: IconButton(
                  onPressed: () => Scaffoldkey.currentState!.openDrawer(),
                  icon: Image.asset(
                    'assets/icon/shop.png',
                    width: context.setIconSize(9),
                    color: c.carts.isEmpty ? Colors.black : Colors.red,
                  ),
                )),
                Positioned(
                  right: context.setWidth(5),
                  top: context.setHeight(-0.3),
                  child: Text(
                    '${value.carts.length}',
                    style: TextStyle(
                        fontSize: context.setFontSize(8), color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          title: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.fastfood),
                text: Lang[Words.foods],
              ),
              Tab(
                icon: const Icon(Icons.local_drink),
                text: Lang[Words.drinks],
              ),
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
        floatingActionButton: InkWell(
          onTap: () {
            c.sendOrder();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.yellow,
                  // spreadRadius: 5,
                  // blurRadius: 7,
                  // offset: Offset(1, 3),
                ),
              ],
            ),
            height: context.setHeight(6),
            width: context.width / 3,
            child: Center(
              child: Text(
                Lang[Words.sendOrder],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: context.setFontSize(10),
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
