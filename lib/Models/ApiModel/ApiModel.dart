import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Models/Apis/AllApis.dart';

class ApiModel {

  Map <String, dynamic> d = {
    'data': 'data1245',
    'message': 'message',
    'sngl': 'sngl',
    'status': 'status',

  };
  Future<Map<String, dynamic>> getData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
    };
    final response = await http.get(
      Uri.parse(Allapis.getItemMenu),
      // headers: headers,
    );

    if (response.statusCode == 200) {
      // Logger.l('message ${d['data']}');
      return await json.decode(
        utf8.decode(response.bodyBytes),
      );
    }

    return {};
  }

  Future<void> sendOrder(Map<String, dynamic> data) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
    };
    final response = await http.post(
      Uri.parse(
        Allapis.sendOrder,
      ),
      body: data,
      headers: headers,
    );
  }
}
