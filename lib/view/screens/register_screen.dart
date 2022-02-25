import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/register_cubit/register_cubit.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../widgets/default_form_field.dart';
import '../widgets/loading_indicator.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccedded) {
          // ignore: avoid_print
          print(state.userInfo.userName);
          Navigator.popAndPushNamed(context, productOverViewScreen);
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'REGISTER',
                        style: titleTextStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Join And Enjoy Big Sale',
                        style: bodyTextStyle,
                      ),
                      horzintalSpace,
                      DefaultFormField(
                        isPassword: false,
                        controller: userNameController,
                        prefixcIcon: Icons.person,
                        hintText: 'Please Enter Your User Name',
                        labelText: 'User Name',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return ' Please enter you user name ';
                          }
                          return null;
                        },
                      ),
                      doubleHorzintalSpace,
                      DefaultFormField(
                        isPassword: false,
                        controller: emailController,
                        prefixcIcon: Icons.email_outlined,
                        hintText: 'Please Enter Your Email Address',
                        labelText: 'Email Address',
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return ' Please enter you email address';
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
                        isPassword: true,
                      ),
                      doubleHorzintalSpace,
                      Center(
                        child: TextButton(
                          style: textButtonStyle,
                          child: state is RegisterLoding
                              ? const LoadingIndicator()
                              : const Text(
                                  'REGISTER',
                                  style: textInTextButtonStyle,
                                ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<RegisterCubit>(context)
                                  .getUserInfo(
                                username: userNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),
                      ),
                      horzintalSpace,
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
