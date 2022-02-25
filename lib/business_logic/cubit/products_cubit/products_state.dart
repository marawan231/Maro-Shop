part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsIsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class ProductIsFavourite extends ProductsState {}

class ProductIsNotFavourite extends ProductsState {}

class FavouriteProductsLoaded extends ProductsState {
  final List<Product> favouriteProducts;

  FavouriteProductsLoaded(this.favouriteProducts);
}

class SizedChosenSuccessfully extends ProductsState {}

class ProductsQuantityIncreased extends ProductsState {}

class ProductsQuantityDecreased extends ProductsState {}
