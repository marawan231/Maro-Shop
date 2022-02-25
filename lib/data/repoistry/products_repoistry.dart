import '../model/Product.dart';
import '../web_services/products_web_services.dart';

class ProductsRepoistry {
  final ProductsWebServices productsWebServices;

  ProductsRepoistry(
    this.productsWebServices,
  );
  Future<List<Product>> getAllProducts() async {
    final products = await productsWebServices.getAllProducts();
    return products.map((product) => Product.fromJson(product)).toList();
  }
}
