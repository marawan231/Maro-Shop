import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../data/model/boardin_item_model.dart';

const onBoardingScreen = '/onBoardingScreen';
const productOverViewScreen = '/productOverViewScreen';
const productDetailsScreen = '/productDetailsScreen';
const cartScreen = '/cartScreen';
const loginScreen = '/loginScreen';
const registerScreen = '/registerScreen';
const ordersScreen = '/ordersScreen';
const favouriteProductsScreen = '/favouriteProductsScreen';
const baseUrl = 'https://eco-mern-api.herokuapp.com/api/';

List catigories = [
  {
    'title': 'Men',
    'icon': const FaIcon(FontAwesomeIcons.male),
  },
  {
    'title': 'Women',
    'icon': const    FaIcon(FontAwesomeIcons.female),
  },
  {
    'title': 'Kids',
    'icon': const FaIcon(FontAwesomeIcons.child),
  },
  {
    'title': 'Couple',
    'icon': const FaIcon(FontAwesomeIcons.peopleArrows),
  },
  {'title': 'Others', 'icon': const FaIcon(FontAwesomeIcons.expand)},
];

List<BoardItem> boardings = [
  BoardItem(Lottie.asset('assets/images/1.json'), 'Shop Online',
      'Make an order sitting on a sofa.Choose and Pay online'),
  BoardItem(Lottie.asset('assets/images/2.json'), 'Big Sale',
      'Enjoy big sales on our various collection'),
  BoardItem(Lottie.asset('assets/images/3.json'), 'Best Products',
      'A variety of products to satisfy all tastes'),
];
/*
 'username': 'maromaro222',
        'email': 'marawan553@gmail.com',
      
/////////////////////////////////////////////
        "username" :"marawan33",
        "email" :"marawan33@gmail.com",
         */