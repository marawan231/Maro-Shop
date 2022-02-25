import 'package:flutter/material.dart';
import '../../constants/styles.dart';
import '../../data/model/Product.dart';
import '../widgets/bottom_icons.dart';
import '../widgets/custom_image.dart';
import '../widgets/list_of_colors.dart';
import '../widgets/product_size_container.dart';
import '../widgets/quantity_of_product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final int index;
  const ProductDetailsScreen({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  Widget buildDetailsOfProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitleOfProduct(),
              ProductSizeContainer(sizes: product.size),
              QuantityOfProduct(
                quantityofProduct: product.quantity,
                index: index,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '\$${product.price}.00',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        const ListOfColor(),
      ],
    );
  }

  Widget buildTitleOfProduct() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        product.titel!,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildDescriptionOfProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          product.desc!,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: containerDecoration,
              child: CustomImage(
                product.img!,
                radius: 20,
                width: double.infinity,
                height: 300,
              ),
            ),
            buildDetailsOfProduct(),
            buildDescriptionOfProduct(),
            BottomIcons(
              product: product,
              index: index,
            ),
          ],
        ),
      ),
    );
  }
}
