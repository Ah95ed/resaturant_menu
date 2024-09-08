import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/CartController.dart';
import 'package:restaurant_management/Helper/Service/onRunInit.dart';
import 'package:restaurant_management/Models/CartModels.dart';
import 'package:restaurant_management/View/StyleApp/SizeApp/SizeApp.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isMobile ? 2 : 4,
          ),
          itemCount: 18,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.setWidth(1),
                vertical: context.setHeight(1),
              ),
              child: const Changecolor(),
            );
          },
        ),
      ),
    );
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
    return Consumer<CartController>(
      builder: (context, cartProvider, child) {
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
                    cartProvider.addToCart(
                      Cartmodels(
                        name: 'Food Name',
                        price: 100,
                        quantity: 1,
                      ),
                    );
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
