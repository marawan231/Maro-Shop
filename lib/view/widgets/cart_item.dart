import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../business_logic/cubit/cart_cubit/cart_cubit.dart';
import '../../data/model/Product.dart';

class CartItem extends StatelessWidget {
  final Product productInCart;
  final int index;

  const CartItem({Key? key, required this.productInCart, required this.index})
      : super(key: key);

  Widget builTrailingWidget(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            BlocProvider.of<CartCubit>(context)
                .increaseNumberOfProductsInCart(index);
          },
          icon: const Icon(
            Icons.add,
          ),
        ),
        Text(' ${productInCart.quantity} x'),
        IconButton(
          onPressed: () {
            BlocProvider.of<CartCubit>(context)
                .decreaseNumberOfProductsInCart(index);
          },
          icon: const Icon(
            Icons.remove,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(productInCart.sId),
      background: Container(
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        BlocProvider.of<CartCubit>(context).removeProductFromCart(index);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: sky, //const Color(0xFF7379EE),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    '\$${productInCart.price}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(productInCart.titel!),
            subtitle: Text(
                'Total: ${BlocProvider.of<CartCubit>(context).priceOfProduct(index)}'),
            trailing: builTrailingWidget(context),
          ),
        ),
      ),
    );
  }
}
