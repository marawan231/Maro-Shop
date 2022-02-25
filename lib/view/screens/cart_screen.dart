import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../business_logic/cubit/cart_cubit/cart_cubit.dart';
import '../widgets/cart_item.dart';
import '../../data/model/Product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> productsInCart;
  const CartScreen({Key? key, required this.productsInCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: sky),
            backgroundColor: sky,
            title: const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(15),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      Chip(
                          label: Text(
                            '\$${BlocProvider.of<CartCubit>(context).totalAmount}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: sky //const Color(0xFF7379EE),
                          ),
                      TextButton(
                        child: const Text(
                          'ORDER NOW',
                          style: TextStyle(color: blue //Color(0xFF7379EE),
                              ),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: productsInCart.length,
                  itemBuilder: ((context, index) {
                    return CartItem(
                      productInCart: productsInCart[index],
                      index: index,
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
