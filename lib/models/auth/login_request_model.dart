class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
