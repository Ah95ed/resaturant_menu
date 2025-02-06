import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_management/Controller/DataApiController/DataApiController.dart';
import 'package:restaurant_management/Helper/Language/LanguageContrller.dart';
import 'package:restaurant_management/Helper/Language/Words.dart';
import 'package:restaurant_management/Helper/Location/LocationClint.dart';
import 'package:restaurant_management/Helper/Logger/Logger.dart';

class Customdialog extends StatefulWidget {
  const Customdialog({super.key});


  @override
  State<Customdialog> createState() => _CustomdialogState();
}

class _CustomdialogState extends State<Customdialog> {
  final TextEditingController _number = TextEditingController();
  double? longtude;
  double? latitude;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _number.dispose();
  }

  Position? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getLocation();
  }

  void getLocation() async {
    position = await LocationClient.instanse.getCurrentLocation();

    longtude = position!.longitude;
    latitude = position!.latitude;
    
  }

  @override
  Widget build(BuildContext context) {
    final c = context.read<DataApiController>();
    return AlertDialog(
      title: Text(
        Lang[Words.interNumber],
      ),
      content: TextFormField(
        controller: _number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: Lang[Words.interNumber],
        ),
        keyboardType: TextInputType.number,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(Lang[Words.cancel]),
        ),
        // const Spacer(),
        TextButton(
          onPressed: () async {
            if (_number.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(Lang[Words.interNumber])),
              );
              return;
            } else if (_number.text.length < 11) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(Lang[Words.wrongNumber])),
              );
              return;
            }
    
            await c.sendOrder(
              _number.text,
              longtude!,
              latitude!,
            );
    
            Navigator.pop(context);
          },
          child: Text(Lang[Words.send]),
        ),
      ],
    );
  }
}
