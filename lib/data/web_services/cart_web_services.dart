import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CartWebServices {
  late Dio dio;

  CartWebServices() {
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

  Future<Map<String, dynamic>> getCartInfo(userId, productId, quantity) async {
    try {
      Response response = await dio.post('cart', data: {
        'userId': userId,
        'products': [
          {
            'prodctId': productId,
            'quantity': quantity,
          },
        ]
      });
      return response.data;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return {};
    }
  }
}
