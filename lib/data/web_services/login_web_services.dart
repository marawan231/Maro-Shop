import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class LoginWebServices {
  late Dio dio;

  LoginWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
      headers: {
        "Content-Type": "application/json",
      },
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getUserInfo(
      String username, String password) async {
    try {
      Response response = await dio.post('auth/login', data: {
        'username': username,
        'password': password,
      });
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return {};
    }
  }
}
