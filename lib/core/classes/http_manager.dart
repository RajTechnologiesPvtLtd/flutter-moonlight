import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/config.dart';

class MLApi {
  postData(data, apiUrl) async {
    var fullUrl = apiUrl;
    // var token = await _getToken();
    try {
      return await http
          .post(
            Uri.parse(fullUrl),
            body: jsonEncode(data),
            headers: ApiEndpoint.headers,
          )
          .timeout(
            const Duration(seconds: 5),
          );
    } on TimeoutException {
      return http.Response(jsonEncode({"success": false, "code": 404}), 404);
    } on Exception {
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
            headers: ApiEndpoint.headers,
          )
          .timeout(
            const Duration(seconds: 5),
          );
    } on TimeoutException {
      return http.Response(jsonEncode({"success": false, "code": 404}), 404);
    } on Exception {
      return http.Response(jsonEncode({"success": false, "code": 404}), 404);
    }
  }

  // _getToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   return localStorage.getString('token');
  // }
}
