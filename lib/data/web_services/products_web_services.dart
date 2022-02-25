import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class ProductsWebServices {
  late Dio dio;
  ProductsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('products');

      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }
}
