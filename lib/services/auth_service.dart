import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../config/config.dart';
import '../core/classes/classes.dart';
import '../models/models.dart';

class AuthService {
  bool isLoggedIn() {
    // Check if the user is logged in
    // Return true if logged in, false otherwise
    return true;
  }

  Future<LoginResponseModel?> login(LoginRequestModel model) async {
    MLApi mlApi = MLApi();
    final response = await mlApi.postData(model.toJson(), ApiEndpoint.login);
    if (response.statusCode == HttpStatus.ok) {
      var jsonData = jsonDecode(response.body);
      CacheManager.saveData("api_token", jsonData['data']['token']);
      return LoginResponseModel.fromJson(jsonData);
    } else {
      return null;
    }
  }

  Future logout() async {
    MLApi mlApi = MLApi();
    bool checkToken = await CacheManager.checkKeyExist("api_token");
    if (checkToken) {
      var token = CacheManager.readData("api_token");
      final response = await mlApi.postData([], ApiEndpoint.logout);
      if (response.statusCode == HttpStatus.ok) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        return null;
      }
    }
    CacheManager.deleteData("api_token");
  }
}
