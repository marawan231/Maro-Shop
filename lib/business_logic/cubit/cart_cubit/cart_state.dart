part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class ProductAddedToCartSucceccfully extends CartState {
  final List<Product> productsInCart;

  ProductAddedToCartSucceccfully(this.productsInCart);
}

class ProductRemovedFromCartSucceccfully extends CartState {
  final List<Product> productsInCart;

  ProductRemovedFromCartSucceccfully(this.productsInCart);
}

class DismissProductFromCartSuccess extends CartState {}

class IncreaseNumberOfProductsInCartSuccess extends CartState {}

class DecreaseNumberOfProductsInCartSuccess extends CartState {}

class ProductToCartSuccess extends CartState {}
