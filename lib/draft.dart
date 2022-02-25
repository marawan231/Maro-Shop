/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/business_logic/cubit/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccedded) {
          // ignore: avoid_print
          print(state.userInfo.token);
        }

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextButton(
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).getUserInfo();
                },
                child: const Text('Login'),
              ),
            ],
          ),
        );
      },
    );
  }
}
 */

/*Widget buildSizesOfProduct() {
    return SizedBox(
      width: 200,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.size!.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all<Color>(Colors.white),
                overlayColor: MaterialStateProperty.all<Color>(purple),
                elevation: MaterialStateProperty.all<double>(20),
                backgroundColor: buttons[index]!
                    ? MaterialStateProperty.all(purple)
                    : MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<CircleBorder>(
                  const CircleBorder(
                    side: BorderSide(color: Colors.white54),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  buttons[index] = true;
                });
                buttons.forEach((k, v) {
                  if (index != k) {
                    buttons[k] = false;
                  }
                });
              },
              child: Text(
                widget.product.size![index],
                style: const TextStyle(color: Colors.black),
              ),
            ),
          );
        }),
      ),
    );
  }*/

//old app bar
    /*  appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            'My Shop',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            buildPopMenu(),
            buildBadge(),
          ],
        ),*/



         // circle collections 
       /* Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: primary,
                      ),
                      shape: BoxShape.circle),
                  child: CustomImage(
                    data["image"],
                    width: 65,
                    height: 65,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data["title"],
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          );*/

             /* CircleAvatar(
          backgroundColor: product.isFav ? Colors.red.shade300 : Colors.grey,
          child: IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              product.isFav = BlocProvider.of<ProductsCubit>(context)
                  .toggleFavourite(product.isFav, index, product.sId!);
            },
          ),
        );*/


          /*GestureDetector(
          child: AnimatedContainer(
              padding: const EdgeInsets.all(2.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(
                color: product.isFav
                    ? red
                    : const Color(0xFFcdacf9).withOpacity(0),
                shape: BoxShape.circle,
              ),
              child: product.isFav
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 22,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 22,
                    )),
          onTap: () {
            product.isFav =
                BlocProvider.of<ProductsCubit>(context).toggleFavourite(
              product.isFav,
              index,
              product.sId!,
            );
          },
        );
      },
    );*/


    /*
    
  Widget buildPopMenu() {
    return PopupMenuButton(
        onSelected: (FilterOption selectedValue) {
          if (selectedValue == FilterOption.FavouriteProducts) {
            setState(() {
              showFavouriteList = true;
              inFavScreen = true;
            });
            favouriteProducts = BlocProvider.of<ProductsCubit>(context)
                .getFavouriteProductList();
            showFavouriteList = true;
          } else {
            setState(() {
              showFavouriteList = false;
            });
          }
        },
        icon: const Icon(Icons.more_vert),
        itemBuilder: (_) {
          return [
            const PopupMenuItem(
              child: Text('Favourites Products'),
              value: FilterOption.FavouriteProducts,
            ),
            const PopupMenuItem(
              child: Text('All Products'),
              value: FilterOption.AllProducts,
            ),
          ];
        });
  } */