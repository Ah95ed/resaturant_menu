import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/DataApiController/DataApiController.dart';
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Helper/Service/onRunInit.dart';
import 'package:restaurant_management/Models/CartModels.dart';
import 'package:restaurant_management/View/StyleApp/SizeApp/SizeApp.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.yellow.shade100,
      child: Consumer<DataApiController>(
        builder: (context, data, child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobile ? 2 : 4,
            ),
            itemCount: data.dataList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.setWidth(1),
                  vertical: context.setHeight(1),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.setRadius(4)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Image.network(
                          'https://moath.pointeam.org/cabtinwhatsapp/img/ricechk.jpeg',
                          width: context.setWidth(50),
                          height: context.setHeight(33),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: context.setHeight(3),
                        left: 2.8,
                        child: Text(
                          data.dataList[index]['txt'],
                          style: TextStyle(
                            fontSize: context.setFontSize(8),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            shadows: const <Shadow>[
                              Shadow(
                                offset: Offset(1.0, -2.0),
                                blurRadius: 4.0,
                                color: Colors.white,
                              ),
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: context.setHeight(0.5),
                        left: 1.8,
                        child: Text(
                          data.dataList[index]['id'],
                          style: TextStyle(
                            fontSize: context.setFontSize(8),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            shadows: const <Shadow>[
                              Shadow(
                                offset: Offset(1.0, -2.0),
                                blurRadius: 4.0,
                                color: Colors.white,
                              ),
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -4,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            data.addToCart(
                              Cartmodels(
                                name: data.dataList[index]['txt'],
                                price: double.parse(data.dataList[index]['id']),
                                quantity: 1,
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            size: context.setIconSize(8),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    ));
  }
}

class Changecolor extends StatefulWidget {
  const Changecolor({
    super.key,
  });

  @override
  State<Changecolor> createState() => _ChangecolorState();
}

class _ChangecolorState extends State<Changecolor> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataApiController>(
      builder: (context, data, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.setRadius(4)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(179, 252, 250, 139),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(1, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: context.setHeight(4),
                child: Image.asset(
                  path,
                  width: context.setWidth(50),
                  height: context.setHeight(33),
                ),
              ),
              Positioned(
                bottom: context.setHeight(0.8),
                left: 1.8,
                child: const Text("Food Name"),
              ),
              Positioned(
                bottom: -8,
                right: 0,
                child: IconButton(
                  onPressed: () {
                    // data.addToCart(
                    //   Cartmodels(
                    //     name: data.dataList[] ,
                    //     price: 100,
                    //     quantity: 1,
                    //   ),
                    // );
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
