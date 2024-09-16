import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Models/Apis/AllApis.dart';

class ApiModel {
  Future<Map<String, dynamic>> getData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8',
      'Accept': 'application/json',
    };
    try {
      final response = await http.get(
        Uri.parse(Allapis.getItemMenu),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Logger.l('message success ${utf8.decode(response.bodyBytes)}');
        return await json.decode(
          utf8.decode(response.bodyBytes),
        );
      }
    } catch (e) {
      Logger.l('message error $e');
    }

    return {};
  }

  Future<void> sendOrder(Map<String,List> data) async {
    
    http.Response response;
    Logger.l('message data ${jsonEncode(data)}');

    try {
      response = await http.post(
        Uri.parse(
          Allapis.sendOrder,
        ),
        body: jsonEncode(data),
         headers: {
        'Content-Type': 'application/x-www-form-urlencoded', // نوع البيانات استمارة
      },
      );
      if (response.statusCode == 200) {
        Logger.l('Data sent successfully: ${response.body}');
      }
    } catch (e) {
      Logger.l('Data Error sent: $e');
    }
  }
}
