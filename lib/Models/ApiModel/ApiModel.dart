import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_management/Helper/Logger/Logger.dart';

class ApiModel {
  static const api = 'https://moath.pointeam.org/apicabtin/read.php';

  Future<Map<String, dynamic>> getData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
    };
    final response = await http.get(
      Uri.parse(api),
      headers: headers,
    );

    if (response.statusCode == 200) {
      Logger.l('message ${response.body}');
      return await json.decode(
        utf8.decode(response.bodyBytes),
      );
    }

    return {};
  }
}
