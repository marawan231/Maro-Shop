part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccedded extends LoginState {
  final LoginModel userInfo;

  LoginSuccedded(this.userInfo);
}

class LoginLoding extends LoginState {}

class LoginErorr extends LoginState {
  final String errorText;

  LoginErorr(this.errorText);
}

class LoginChangePasswordVisibiltyState extends LoginState {}
