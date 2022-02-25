import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class RegisterWebServices {
  late Dio dio;
  RegisterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
      headers: {"Content-Type": "application/json"},
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> userRegister(username, email, password) async {
    try {
      Response response = await dio.post(
        'auth/register',
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return {};
    }
  }
}
