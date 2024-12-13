import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../modules/auth/models/models.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class LoginService extends GetConnect {
  // final String loginUrl = 'http://10.0.2.2:8000/api/login';
  // final String loginUrl = 'http://127.0.0.1:8000/api/login';
  final String loginUrl = 'https://reqres.in/api/login';
  final String registerUrl = 'https://reqres.in/api/register';

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson(), headers: {
      "Content-Type": 'application/json',
      "Accept": "multipart/form-data"
    });
    if (response.statusCode == HttpStatus.ok) {
      // print(response.body['data']['token']);
      // return LoginResponseModel.fromJson(response.body['data']);
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson(), headers: {
      "Content-Type": 'application/json',
      "Accept": "multipart/form-data"
    });
    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
