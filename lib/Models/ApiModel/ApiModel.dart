import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:restaurant_management/Helper/Logger/Logger.dart';
import 'package:restaurant_management/Models/Api/Api.dart';

class ApiModel {
  Future<Map<String, List>> getData() async {
    Map<String, String> headers = {
    'Content-Type':'application/json;charset=UTF-8',
    'Charset': 'utf-8',
    // 'Authorization': 'Basic YWRtaW46c2VjcmV0',
    // 'Accept': 'application/json',
    // 'Connection': 'keep-alive',
    // 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.142.86 Safari/537.36',
    // 'X-Forwarded-For': '89.0.142.86'

};
    final response = await http.get(Uri.parse(Api.api),headers: headers);

    if (response.statusCode == 200) {
      Logger.l('message connect is done ');
      final data = await json.decode(json.encode(response.body));
      log('message ======> $data ');
      return {'a' : ['ab']};
    }

    return {'a' : ['a']};
  }
}
