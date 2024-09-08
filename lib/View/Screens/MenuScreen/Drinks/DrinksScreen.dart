import 'package:flutter/material.dart';
import 'package:restaurant_management/Helper/Service/onRunInit.dart';

class DrinkCard extends StatelessWidget {
  const DrinkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow.shade100,
      child: Image.asset(
        path,
        height: 50,
        width: 50,
      ),
    );
  }
}
