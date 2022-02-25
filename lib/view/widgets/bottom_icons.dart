import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/cart_cubit/cart_cubit.dart';
import '../../business_logic/cubit/products_cubit/products_cubit.dart';
import '../../constants/colors.dart';
import '../../data/model/Product.dart';
import 'favourite_icon_box.dart';

class BottomIcons extends StatelessWidget {
  const BottomIcons({Key? key, required this.product, required this.index})
      : super(key: key);
  final Product product;

  final int index;
  Widget buildFavouriteButton() {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return FavouriteIconBox(
          product: product,
          index: index,
          padding: const EdgeInsets.all(5.0),
          favouriteCaseColorOfTheIcon: Colors.white,
          unFavouriteCaseColorOfTheIcon: Colors.white,
          favouriteCaseColorOfTheContainer: red,
          unFavouriteCaseColorOfTheContainer: Colors.grey,
          iconSize: 40,
          onTap: () {
            product.isFav =
                BlocProvider.of<ProductsCubit>(context).toggleFavourite(
              product.isFav,
              index,
              product.sId!,
            );
          },
        );
      },
    );
  }

  Widget buildAddToCartButton() {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: InkWell(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                color: product.isInCart
                    ? green
                    : labelColor, //const Color.fromARGB(255, 78, 77, 77),
                border: Border.all(
                  color: const Color(0xFFcdacf9),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              height: 50,
              child: Center(
                child: Text(
                  product.isInCart
                      ? 'Product Added To Cart Succssefully'
                      : 'Add To Cart',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              product.isInCart = BlocProvider.of<CartCubit>(context)
                  .toogleCartIcon(product.isInCart);
              BlocProvider.of<CartCubit>(context).addProductInCart(product.sId,
                  BlocProvider.of<ProductsCubit>(context).products);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildFavouriteButton(),
        const SizedBox(
          width: 15,
        ),
        buildAddToCartButton(),
      ],
    );
  }
}
