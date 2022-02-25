import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/register_model.dart';
import '../../../data/repoistry/register_repoistry.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepoistry registerRepoistry;
  RegisterCubit(this.registerRepoistry) : super(RegisterInitial());

  void getUserInfo(
      {required String username,
      required String email,
      required String password}) {
    emit(RegisterLoding());
    registerRepoistry.userRegister(username, email, password).then((userInfo) {
      emit(RegisterSuccedded(userInfo));
    }).catchError((e) {
      emit(RegisterErorr(e));
    });
  }
}
