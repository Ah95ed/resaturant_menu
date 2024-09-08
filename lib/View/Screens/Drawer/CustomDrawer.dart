import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/CartController.dart';



class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartProvider, child) {
        return Drawer(
          backgroundColor: Colors.yellow.shade100,
          elevation: 5,
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.carts.length,
                itemBuilder: (context, index) {
                  final product = cartProvider.carts[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toString()}'),
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
            Text('Cart Total: \$${cartProvider.getAllPriceCart()}'),
          ]),
        );
      },
    );
  }
}