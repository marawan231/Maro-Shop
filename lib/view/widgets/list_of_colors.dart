import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class ListOfColor extends StatelessWidget {
  const ListOfColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: 40,
      child: ListView.builder(
        itemCount: listColors.length,
        itemBuilder: ((context, index) {
          return TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(listColors[index]),
            ),
            onPressed: () {},
            child: const Text(''),
          );
        }),
      ),
    );
  }
}
