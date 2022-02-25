import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/model/Product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<Product> productsInCart = [];
  int? numberOfProductsInCart = 0;

  List<Product> addProductInCart(id, products) {
    var product = productsInCart.where(
      (product) => product.sId == id,
    );

    if (product.isEmpty) {
      productsInCart.addAll(products.where((product) => product.sId == id));
      numberOfProductsInCart = productsInCart.length;
      emit(ProductAddedToCartSucceccfully(productsInCart));
    } else {
      productsInCart.removeWhere(((product) => product.sId == id));
      emit(ProductRemovedFromCartSucceccfully(productsInCart));
    }

    return productsInCart;
  }

  void removeProductFromCart(int index) {
    productsInCart[index].isInCart = false;
    productsInCart.removeAt(index);
    emit(DismissProductFromCartSuccess());
    // productsInCart.removeWhere(((product) => product.sId == id));
  }

  void increaseNumberOfProductsInCart(int index) {
    emit(IncreaseNumberOfProductsInCartSuccess());
    productsInCart[index].quantity++;
  }

  void decreaseNumberOfProductsInCart(int index) {
    emit(DecreaseNumberOfProductsInCartSuccess());
    if (productsInCart[index].quantity <= 1) {
      productsInCart[index].quantity = 1;
    } else {
      productsInCart[index].quantity--;
    }
  }

  bool toogleCartIcon(bool toCart) {
    emit(ProductToCartSuccess());
    toCart = !toCart;

    return toCart;
  }

  double get totalAmount {
    double total = 0.0;

    for (Product cartItem in productsInCart) {
      total += cartItem.quantity * int.parse(cartItem.price!);
    }

    return total;
  }

  String priceOfProduct(index) {
    int priceOfproduct = productsInCart[index].quantity *
        int.parse(productsInCart[index].price!);
    return "\$$priceOfproduct";
  }
}
