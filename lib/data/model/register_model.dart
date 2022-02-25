class RegisterModel {
  late String userName;
  late String email;
  late String password;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    email = json['email'];
    password = json['password'];
  }
}
