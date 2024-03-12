
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instightful_interviews_app/core/error/exception.dart';

class API {
  final String apiUrl = "http://localhost:8080/api";

  Future<dynamic> post({required String path, required Map params}) async {
    try {
      var url = Uri.parse('$apiUrl/$path');
      Map<String, String> userHeader = {
        "Content-type": "application/json",
        "Accept": "application/json"
      };
      print(params);
      var response =
          await http.post(url, headers: userHeader, body: json.encode(params));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw AuthException(message: response.body);
      }
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      //TODO: handle error
      print(e.toString());
      throw ServerException();
    }
  }

  Future<dynamic> get({required String path}) async {
    try {
      var url = Uri.parse('$apiUrl/$path');
      var response = await http.get(url);

      return jsonDecode(response.body); //
    } catch (e) {
      //TODO: handle error
      throw ServerException();
    }
  }
}

