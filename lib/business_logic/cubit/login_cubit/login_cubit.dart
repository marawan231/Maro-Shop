import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/model/login_model.dart';
import '../../../data/repoistry/login_repoistry.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepoistry loginRepoistry;
  Icon suffixIcon = const Icon(Icons.visibility);
  bool isPassowrdShown = true;
 

  LoginCubit(this.loginRepoistry) : super(LoginInitial());

  void getUserInfo({required String username, required String password}) {
    emit(LoginLoding());
    loginRepoistry.getUserInfo(username, password).then((userInfo) {
      emit(LoginSuccedded(userInfo));
      
    }).catchError((e) {
      emit(LoginErorr(e));
    });
  }

  void tooglePasswordVisibilty() {
    isPassowrdShown = !isPassowrdShown;
    suffixIcon = isPassowrdShown
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off_outlined);
    emit(LoginChangePasswordVisibiltyState());
  }
}
