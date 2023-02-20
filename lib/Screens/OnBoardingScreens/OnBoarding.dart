import 'package:flutter/material.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Screens/OnBoardingScreens/OnBoardingT.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MyColors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/psi.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                      children: const [])),
              TextWidget(
                  input: "      Meet your coach\n""START YOUR JOURNEY",
                  fontsize: 24,
                  fontWeight: FontWeight.w700,
                  textcolor: MyColors.whiteColor),
              BtnNullHeightWidth(
                  title: "Next",
                  bgcolour: MyColors.orangeColor,
                  textcolour: MyColors.whiteColor,
                  onPress: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>OnBoardingT(),
                      ),
                          (route) => false,
                    );

                  },
                  width: 150,
                  height: 39),
              Utils.FORM_HINT_PADDING,



            ],
          ),
        ),
      )),
    );
  }
}
