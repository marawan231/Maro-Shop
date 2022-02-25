import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/cart_cubit/cart_cubit.dart';
import '../../constants/colors.dart';
import '../../data/model/Product.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton(
      {Key? key, required this.product, required this.allProducts})
      : super(key: key);
  final Product product;
  final List<Product> allProducts;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return GestureDetector(
          child: AnimatedContainer(
              padding: const EdgeInsets.all(2.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                color: product.isInCart
                    ? blue
                    : const Color(0xFFcdacf9).withOpacity(0),
                shape: BoxShape.circle,
              ),
              child: product.isInCart
                  ? const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 22,
                    )
                  : const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.white,
                      size: 22,
                    )),
          onTap: () {
            product.isInCart = BlocProvider.of<CartCubit>(context)
                .toogleCartIcon(product.isInCart);
            BlocProvider.of<CartCubit>(context)
                .addProductInCart(product.sId, allProducts);
          },
        );
      },
    );
  }
}
