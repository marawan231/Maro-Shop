import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/products_cubit/products_cubit.dart';
import '../../constants/colors.dart';
import '../../data/model/Product.dart';
import 'favourite_icon_box.dart';

class CustomFavouriteIconButton extends StatelessWidget {
  const CustomFavouriteIconButton(
      {Key? key, required this.product, required this.index})
      : super(key: key);
  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FavouriteIconBox(
            product: product,
            index: index,
            padding: const EdgeInsets.all(2.0),
            favouriteCaseColorOfTheIcon: Colors.white,
            unFavouriteCaseColorOfTheIcon: Colors.white,
            favouriteCaseColorOfTheContainer: red,
            unFavouriteCaseColorOfTheContainer:
                const Color(0xFFcdacf9).withOpacity(0),
            onTap: () {
              product.isFav =
                  BlocProvider.of<ProductsCubit>(context).toggleFavourite(
                product.isFav,
                index,
                product.sId!,
              );
            },
          );
        });
  }
}
