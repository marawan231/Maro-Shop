import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/products_cubit/products_cubit.dart';
import '../../constants/colors.dart';
import '../widgets/favourite_item.dart';
import '../../data/model/Product.dart';

class FavouriteProductsScreen extends StatelessWidget {
  const FavouriteProductsScreen({Key? key, required this.favouriteProducts})
      : super(key: key);
  final List<Product> favouriteProducts;

  Widget buildBlocWidget() {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return buildTheBody();
      },
    );
  }

  Widget buildTheBody() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildTheFavouriteList(),
          ],
        ),
      ),
    );
  }

  Widget buildTheFavouriteList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: favouriteProducts.length,
      itemBuilder: ((context, index) {
        return FavouriteItem(
          key: ValueKey(favouriteProducts[index].sId),
          product: favouriteProducts[index],
          index: index,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: red),
        title: const Text(
          'favourites',
        ),
        backgroundColor: red,
      ),
      body: buildBlocWidget(),
    );
  }
}
