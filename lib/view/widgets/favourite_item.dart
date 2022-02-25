import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/products_cubit/products_cubit.dart';
import 'custom_cart_button.dart';
import 'custom_favourite_icon_button.dart';
import '../../constants/strings.dart';
import '../../data/model/Product.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key, required this.product, required this.index})
      : super(key: key);
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, productDetailsScreen, arguments: {
          'product': product,
          'index': index,
        });
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: Container(
              color: Colors.white,
              child: product.img!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loading.gif',
                      image: product.img!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/placeholder.jpg'),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(
                product.titel!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              leading:
                  CustomFavouriteIconButton(product: product, index: index),
              trailing: CustomCartButton(
                product: product,
                allProducts: BlocProvider.of<ProductsCubit>(context).products,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
