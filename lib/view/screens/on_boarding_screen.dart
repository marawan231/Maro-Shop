import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../../data/model/boardin_item_model.dart';
import '../../helpers/shared_prefrences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();
  bool isLast = false;

  Widget buildOnBoardItem(BoardItem boardItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 2, child: boardItem.image),
        Expanded(
          flex: 1,
          child: Text(
            boardItem.title,
            style: onBoardinTextStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            boardItem.body,
            textAlign: TextAlign.center,
            style: onBoardinTextStyle.copyWith(
              color: Colors.black45,
            ),
          ),
        ),
      ],
    );
  }

  void goToLoginScreen() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boardings.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  }
                },
                controller: boardController,
                itemCount: boardings.length,
                itemBuilder: (context, index) =>
                    buildOnBoardItem(boardings[index]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boardings.length,
                    effect: const ExpandingDotsEffect(
                        spacing: 5.0,
                        radius: 4.0,
                        expansionFactor: 4,
                        dotWidth: 10,
                        dotHeight: 10.0,
                        //paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.indigo),
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.arrowRight),
                    onPressed: () {
                      if (isLast) {
                        goToLoginScreen();
                      } else {
                        boardController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                  ),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                backgroundColor: onBoardingTextButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                goToLoginScreen();
              },
            ),
          ],
        ),
      ),
    );
  }
}
