import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/cart_cubit/cart_cubit.dart';
import 'business_logic/cubit/login_cubit/login_cubit.dart';
import 'business_logic/cubit/orders_cubit/orders_cubit.dart';
import 'business_logic/cubit/products_cubit/products_cubit.dart';
import 'business_logic/cubit/register_cubit/register_cubit.dart';
import 'constants/strings.dart';
import 'data/model/Product.dart';
import 'data/repoistry/login_repoistry.dart';
import 'data/repoistry/products_repoistry.dart';
import 'data/repoistry/register_repoistry.dart';
import 'data/web_services/login_web_services.dart';
import 'data/web_services/products_web_services.dart';
import 'data/web_services/register_web_services.dart';
import 'view/screens/cart_screen.dart';
import 'view/screens/favourite_product_screen.dart';
import 'view/screens/login_screen.dart';
import 'view/screens/on_boarding_screen.dart';
import 'view/screens/orders_screen.dart';
import 'view/screens/product_details_screen.dart';
import 'view/screens/product_overview_screen.dart';
import 'view/screens/register_screen.dart';

class AppRouter {
  late ProductsRepoistry productsRepoistry;
  late ProductsCubit productsCubit;
  late LoginRepoistry loginRepoistry;
  late LoginCubit loginCubit;
  late RegisterRepoistry registerRepoistry;
  late RegisterCubit registerCubit;
  late CartCubit cartCubit;
  late OrdersCubit ordersCubit;

  AppRouter() {
    productsRepoistry = ProductsRepoistry(ProductsWebServices());
    productsCubit = ProductsCubit(productsRepoistry);
    loginRepoistry = LoginRepoistry(LoginWebServices());
    loginCubit = LoginCubit(loginRepoistry);
    registerRepoistry = RegisterRepoistry(RegisterWebServices());
    registerCubit = RegisterCubit(registerRepoistry);
    cartCubit = CartCubit();
    ordersCubit = OrdersCubit();
  }

  Route? genertaRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case productOverViewScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: productsCubit),
              BlocProvider.value(value: cartCubit),
            ],
            child: const ProductOverViewScreen(),
          ),
        );

      case productDetailsScreen:
        final arguments = settings.arguments as Map;
        final product = arguments['product'] as Product;
        final index = arguments['index'] as int;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: productsCubit),
              BlocProvider.value(value: cartCubit),
            ],
            child: ProductDetailsScreen(
              product: product,
              index: index,
            ),
          ),
        );

      case cartScreen:
        final List<Product> productsInCart =
            settings.arguments as List<Product>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cartCubit,
            child: CartScreen(productsInCart: productsInCart),
          ),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: loginCubit,
            child: const LoginScreen(),
          ),
        );
      case ordersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: ordersCubit,
            child: const OrdersScreen(),
          ),
        );

      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => registerCubit,
            child: RegisterScreen(),
          ),
        );
      case favouriteProductsScreen:
        final List<Product> favouriteProducts =
            settings.arguments as List<Product>;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: productsCubit),
              BlocProvider.value(value: cartCubit),
            ],
            child: FavouriteProductsScreen(
              favouriteProducts: favouriteProducts,
            ),
          ),
        );
    }
    return null;
  }
}
