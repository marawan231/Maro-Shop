import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/cart_cubit/cart_cubit.dart';
import '../../business_logic/cubit/products_cubit/products_cubit.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../data/model/Product.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../widgets/collection_box.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/product_item.dart';

class ProductOverViewScreen extends StatefulWidget {
  final String? userName;
  const ProductOverViewScreen({
    Key? key,
    this.userName,
  }) : super(key: key);

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  List<Product> allProducts = [];
  List<Product> favouriteProducts = [];
  int numberOfProductsInCart = 0;
  List<Product> productsInCart = [];
  bool inFavScreen = false;

  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).getAllProuducts();
    BlocProvider.of<CartCubit>(context).addProductInCart;
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          allProducts = state.products;
        } else if (state is ProductsIsLoading) {
          return const LoadingIndicator();
        }
        return buildLoadedWidget();
      },
    );
  }

  getCollections() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          catigories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CollectionBox(
              data: catigories[index],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoadedWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            getCollections(),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 25),
              child: Text(
                "Popular Products",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            buildProductsList(),
          ],
        ),
      ),
    );
  }

  Widget buildProductsList() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 370,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        allProducts.length,
        (index) => ProductItem(
          key: ValueKey(allProducts[index].sId),
          index: index,
          product: allProducts[index],
          allProducts: allProducts,
          inFavScreen: inFavScreen,
        ),
      ),
    );
  }

  Widget buildBadge() {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is ProductAddedToCartSucceccfully) {
          productsInCart = (state).productsInCart;
        }
        if (state is ProductRemovedFromCartSucceccfully) {
          productsInCart = (state).productsInCart;
        }
      },
      builder: (context, state) {
        return Badge(
          value: productsInCart.length,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart_sharp,
            ),
            onPressed: () {
              Navigator.pushNamed(context, cartScreen,
                  arguments: productsInCart);
            },
          ),
        );
      },
    );
  }

  Widget buildUserNameAndTitle() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.person,
                color: labelColor,
                size: 20,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Marawan Aly',
                style: TextStyle(
                  color: labelColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text("Good Morning!",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              )),
        ],
      ),
    );
  }

  Widget getAppBar() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildUserNameAndTitle(),
          buildBadge(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
            iconTheme: const IconThemeData(color: Colors.grey),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBlocWidget(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
