part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccedded extends RegisterState {
  final RegisterModel userInfo;

  RegisterSuccedded(this.userInfo);
}

class RegisterLoding extends RegisterState {}

class RegisterErorr extends RegisterState {
  final String errorText;

  RegisterErorr(this.errorText);
}
