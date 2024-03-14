import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:instightful_interviews_app/core/error/exception.dart';

class API {
  // final String apiUrl = "http://localhost:8080/api";

  Future<dynamic> post(
      {required String path,
      required Map params,
      apiUrl = "http://localhost:8080/api"}) async {
    try {
      var url = Uri.parse('$apiUrl/$path');
      Map<String, String> userHeader = {
        "Content-type": "application/json",
        "Accept": "application/json"
      };

      var response =
          await http.post(url, headers: userHeader, body: json.encode(params));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw AuthException(message: response.body);
      }
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<dynamic> get(
      {required String path, apiUrl = "http://localhost:8080/api"}) async {
    try {
      var url = Uri.parse('$apiUrl/$path');
      var response = await http.get(url);

      return jsonDecode(response.body); //
    } catch (e) {
      throw ServerException();
    }
  }

  Future<dynamic> sendAudioFile(
      String filePath, String apiUrl, String question, String answer) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception('Audio file not found at path: $filePath');
      }

      final bytes = await file.readAsBytes();
      final multipartRequest = http.MultipartRequest('POST', Uri.parse(apiUrl));

      final audioPart = http.MultipartFile.fromBytes(
        'audio',
        bytes,
        filename: file.path.split('/').last, // Set a filename if needed
      );

      multipartRequest.files.add(audioPart);
      multipartRequest.fields.addAll({"question": question, "answer": answer});

      final streamedResponse = await multipartRequest.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return response.body;
      } else {}
    } on Exception catch (error) {
      throw DatabaseException(error.toString());
    }
  }
}
