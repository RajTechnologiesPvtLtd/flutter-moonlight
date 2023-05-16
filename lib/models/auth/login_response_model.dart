class LoginResponseModel {
  String? token;

  LoginResponseModel({this.token});

  LoginResponseModel.fromJson(json) {
    token = json['data']['token'];
  }
}
