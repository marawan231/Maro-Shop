import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/model/Product.dart';
import '../../../data/repoistry/products_repoistry.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepoistry productsRepoistry;

  List<Product> products = [];
  List<Product> favouritepProducts = [];

  List<Product> productsInCart = [];
  int? numberOfProductsInCart = 0;

  Map<int, bool> buttons = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
  };

  ProductsCubit(
    this.productsRepoistry,
  ) : super(ProductsInitial());

  List<Product> getAllProuducts() {
    emit(ProductsIsLoading());

    productsRepoistry.getAllProducts().then((products) {
      this.products = products;
      emit(ProductsLoaded(products));
    });
    return products;
  }

  bool toggleFavourite(bool isFav, int index, String id) {
    isFav = !isFav;

    if (isFav) {
      emit(ProductIsFavourite());
      favouritepProducts.add(products[index]);
    } else if (!isFav) {
      favouritepProducts.removeWhere((product) => product.sId == id);
      emit(ProductIsNotFavourite());
    }

    return isFav;
  }

  List<Product> getFavouriteProductList() {
    // favouritepProducts = products.where((product) => product.isFav).toList();
    emit(FavouriteProductsLoaded(favouritepProducts));
    return favouritepProducts;
  }

  bool? chooseTheSelectedsize(index) {
    emit(SizedChosenSuccessfully());
    buttons[index] = true;
    buttons.forEach((k, v) {
      if (index != k) {
        buttons[k] = false;
      }
    });
    return buttons[index];
  }

  void increaseQuantityOfSelectedProduct(index) {
    products[index].quantity++;
    emit(ProductsQuantityIncreased());
  }

  void decreaseQuantityOfSelectedProduct(index) {
    products[index].quantity--;
    emit(ProductsQuantityDecreased());
  }
}
