import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:simple_curd_api/models/user_m_1.dart';

const String baseUrl = 'https://curd-api.onrender.com/api/products';

class ApiServices {
  var client = http.Client();
  String endpoint = 'https://curd-api.onrender.com/api/products';
  Future<UserModel1> getUsers() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return UserModel1.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  // Future<dynamic> getUsers() async {
  //   var url = Uri.parse(baseUrl);
  //   // var _headers = {
  //   //   'Authorization': 'Bearer sfie328370428387=',
  //   //   'api_key': 'ief873fj38uf38uf83u839898989',
  //   // };

  //   var response = await client.get(
  //     url,
  //   );
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     //throw exception and catch it in UI
  //   }
  // }

  Future<dynamic> putAPI(String id, dynamic object) async {
    var url = Uri.parse(baseUrl + id);
    var _payload = json.encode(object);
    var _headers = {
      'Content-Type': 'application/json',
    };

    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> post(dynamic object) async {
    var url = Uri.parse(baseUrl);
    var _payload = json.encode(object);
    var _headers = {'Content-Type': 'application/json'};

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  ///
  ///

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {'Content-Type': 'application/json'};

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}
