import '../model/register_model.dart';
import '../web_services/register_web_services.dart';

class RegisterRepoistry {
  final RegisterWebServices registerWebServices;

  RegisterRepoistry(this.registerWebServices);

  Future<RegisterModel> userRegister(username, email, password) async {
    final user =
        await registerWebServices.userRegister(username, email, password);
    return RegisterModel.fromJson(user);
  }
}
