import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/products_cubit/products_cubit.dart';

// ignore: must_be_immutable
class QuantityOfProduct extends StatelessWidget {
  const QuantityOfProduct(
      {Key? key, required this.quantityofProduct, required this.index})
      : super(key: key);
  final int quantityofProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    final productsCubit = BlocProvider.of<ProductsCubit>(context);
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFcdacf9),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: const Color(0xFFcdacf9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.remove,
                ),
                onPressed: () {
                  productsCubit.decreaseQuantityOfSelectedProduct(index);
                },
              ),
              Text(' ${productsCubit.products[index].quantity} x'),
              IconButton(
                icon: const Icon(
                  Icons.add,
                ),
                onPressed: () {
                  productsCubit.increaseQuantityOfSelectedProduct(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
