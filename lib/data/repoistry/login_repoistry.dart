import '../model/login_model.dart';
import '../web_services/login_web_services.dart';

class LoginRepoistry {
  final LoginWebServices loginWebServices;

  LoginRepoistry(this.loginWebServices);

  Future<LoginModel> getUserInfo(String username, String password) async {
    final user = await loginWebServices.getUserInfo(username, password);
    return LoginModel.fromJson(user);
  }
}
