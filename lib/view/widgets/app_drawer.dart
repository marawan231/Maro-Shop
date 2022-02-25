import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/cart_cubit/cart_cubit.dart';
import '../../business_logic/cubit/products_cubit/products_cubit.dart';
import '../../constants/strings.dart';
import '../../helpers/shared_prefrences.dart';
import 'setting_item.dart';
import '../../constants/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.black87,
            ),
            backgroundColor: Colors.black87,
            title: const Text('Hello !'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          SettingItem(
              title: 'My Shop',
              leadingIcon: Icons.shop,
              leadingIconColor: purple,
              onTap: () {
                bool inMainScreen = false;
                inMainScreen
                    // ignore: dead_code
                    ? ''
                    : Navigator.popUntil(context, (route) {
                        if (!route.isFirst) {
                          inMainScreen = false;
                        } else if (route.isFirst) {
                          inMainScreen = true;
                        }
                        return route.isFirst;
                      });
              }),
          const Divider(),
          SettingItem(
              title: 'My Orders',
              leadingIcon: Icons.local_mall_outlined,
              leadingIconColor: blue,
              onTap: () {
                Navigator.popAndPushNamed(context, ordersScreen,
                    arguments:
                        BlocProvider.of<ProductsCubit>(context).productsInCart);
              }),
          const Divider(),
          SettingItem(
            title: 'My Favourites',
            leadingIcon: Icons.favorite,
            leadingIconColor: red,
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                favouriteProductsScreen,
                arguments:
                    BlocProvider.of<ProductsCubit>(context).favouritepProducts,
              );
            },
          ),
          const Divider(),
          SettingItem(
              title: 'My Cart',
              leadingIcon: Icons.shopping_cart,
              leadingIconColor: sky,
              onTap: () {
                Navigator.popAndPushNamed(context, cartScreen,
                    arguments:
                        BlocProvider.of<CartCubit>(context).productsInCart);
              }),
          const Divider(),
          SettingItem(
            title: 'Sign Out',
            leadingIcon: Icons.person,
            leadingIconColor: darker,
            onTap: () {
              CacheHelper.removeData(key: 'token');
              Navigator.pushNamed(context, loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
