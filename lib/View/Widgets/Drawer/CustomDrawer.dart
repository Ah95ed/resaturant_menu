import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/DataApiController/DataApiController.dart';
import 'package:restaurant_management/Helper/Language/LanguageContrller.dart';
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Models/CartModels.dart';
import 'package:restaurant_management/View/StyleApp/SizeApp/SizeApp.dart';

import '../../../Helper/Language/Words.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataApiController>(
      builder: (context, cartProvider, child) {
        return Drawer(
          backgroundColor: Colors.yellow.shade100,
          elevation: 4,
          width: context.setWidth(85),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.carts.length,
                itemBuilder: (context, index) {
                  final product = cartProvider.carts[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(
                      '${product.price.toString()}  x${product.quantity}',
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                    
                        cartProvider.removeCountFromCart(
                          Cartmodels(
                            name: product.name,
                            price: product.price/product.quantity,
                            quantity: 1,
                          ),
                        );
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        cartProvider.removeFromCart(index);
                      },
                    ),
                  );
                },
              ),
            ),
            Text('${Lang[Words.totalPrice]} ${cartProvider.getAllPriceCart()}'),
            SizedBox(
              height: context.setHeight(1),
            )
          ]),
        );
      },
    );
  }
}
