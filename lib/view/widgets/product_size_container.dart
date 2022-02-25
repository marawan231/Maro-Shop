import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/products_cubit/products_cubit.dart';

import '../../constants/colors.dart';

class ProductSizeContainer extends StatelessWidget {
  const ProductSizeContainer({Key? key, required this.sizes}) : super(key: key);
  //final Product product;
  final List<String>? sizes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sizes!.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: BlocConsumer<ProductsCubit, ProductsState>(
              listener: (context, state) {},
              builder: (context, state) {
                return TextButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.all<Color>(purple),
                    elevation: MaterialStateProperty.all<double>(10),
                    backgroundColor:
                        BlocProvider.of<ProductsCubit>(context).buttons[index]!
                            ? MaterialStateProperty.all(purple)
                            : MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<CircleBorder>(
                      const CircleBorder(
                        side: BorderSide(color: Colors.white54),
                      ),
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<ProductsCubit>(context)
                        .chooseTheSelectedsize(index);
                  },
                  child: Text(
                    sizes![index],
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
