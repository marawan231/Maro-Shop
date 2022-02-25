class LoginModel {
  late User user;
  late String token;

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = (json['User'] != null ? User.fromJson(json['User']) : null)!;
  }
}

class User {
  late String id;

  late String username;
  late String email;
  late String password;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    id = json['username'];
    id = json['email'];
    id = json['password'];
  }
}
