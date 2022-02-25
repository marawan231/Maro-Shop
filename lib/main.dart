// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'app_router.dart';
import 'constants/strings.dart';
import 'helpers/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(
    MyShop(
      appRouter: AppRouter(),
    ),
  );
}

class MyShop extends StatelessWidget {
  final AppRouter appRouter;

  MyShop({Key? key, required this.appRouter}) : super(key: key);

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');

  String getInitialScreen(onBoarding, token) {
    if (onBoarding != null) {
      if (token != null) {
        return productOverViewScreen;
      } else {
        return loginScreen;
      }
    } else {
      return onBoardingScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: getInitialScreen(onBoarding, token),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.genertaRoute,
    );
  }
}
