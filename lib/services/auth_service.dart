import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import '../models/models.dart';

class AuthService {
  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    MLApi mlApi = MLApi();
    final response = await mlApi.postData(model.toJson(), ApiEndpoint.login);
    if (response.statusCode == HttpStatus.ok) {
      var jsonData = jsonDecode(response.body);
      return LoginResponseModel.fromJson(jsonData);
    } else {
      return null;
    }
  }
}

class MLApi {
  postData(data, apiUrl) async {
    var fullUrl = apiUrl;
    // var token = await _getToken();
    try {
      return await http
          .post(
            Uri.parse(fullUrl),
            body: jsonEncode(data),
            headers: ApiEndpoint.commanHeader,
          )
          .timeout(
            const Duration(seconds: 5),
          );
    } on TimeoutException catch (e) {
      return http.Response(jsonEncode({"success": false, "code": 404}), 404);
    } on Exception catch (e) {
      return http.Response(jsonEncode({"success": false, "code": 404}), 404);
    }
  }

  getData(apiUrl) async {
    var fullUrl = apiUrl;
    // var token = await _getToken();
    try {
      return await http
          .get(
            Uri.parse(fullUrl),
            headers: ApiEndpoint.commanHeader,
          )
          .timeout(
            const Duration(seconds: 5),
          );
    } on TimeoutException catch (e) {
      return http.Response(jsonEncode({"success": false, "code": 404}), 404);
    } on Exception catch (e) {
      return http.Response(jsonEncode({"success": false, "code": 404}), 404);
    }
  }

  // _getToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   return localStorage.getString('token');
  // }
}
