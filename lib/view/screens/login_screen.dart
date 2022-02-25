// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../helpers/shared_prefrences.dart';
import '../widgets/default_form_field.dart';
import '../../business_logic/cubit/login_cubit/login_cubit.dart';
import '../../constants/styles.dart';
import '../widgets/loading_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String token = '';

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccedded) {
          token = state.userInfo.token;

          CacheHelper.saveData(key: 'token', value: token).then(
            (value) {
              if (value) {
                print(token);

                Navigator.pushReplacementNamed(
                  context,
                  productOverViewScreen,
                );
              }
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Container(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOGIN',
                        style: titleTextStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login now and enjoy the experince',
                        style: bodyTextStyle,
                      ),
                      horzintalSpace,
                      DefaultFormField(
                        isPassword: false,
                        controller: userNameController,
                        prefixcIcon: Icons.person_outline,
                        hintText: 'Please Enter Your User Name',
                        labelText: 'User Name',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return ' Please enter you user name';
                          }
                          return null;
                        },
                      ),
                      doubleHorzintalSpace,
                      DefaultFormField(
                        controller: passwordController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return ' Please enter you password';
                          }
                          return null;
                        },
                        prefixcIcon: Icons.lock_outline_rounded,
                        hintText: 'Please Enter Your  Password',
                        labelText: 'Password',
                        isPassword: BlocProvider.of<LoginCubit>(context)
                            .isPassowrdShown,
                        suffixIcon: IconButton(
                          color: loginIconsSuffixAndPrefixColor,
                          icon: BlocProvider.of<LoginCubit>(context).suffixIcon,
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context)
                                .tooglePasswordVisibilty();
                          },
                        ),
                      ),
                      doubleHorzintalSpace,
                      Center(
                        child: TextButton(
                          style: textButtonStyle,
                          child: state is LoginLoding
                              ? const LoadingIndicator()
                              : const Text(
                                  'Login',
                                  style: textInTextButtonStyle,
                                ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).getUserInfo(
                                username: userNameController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                      ),
                      horzintalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Dont have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, registerScreen);
                            },
                            child: const Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.indigoAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
