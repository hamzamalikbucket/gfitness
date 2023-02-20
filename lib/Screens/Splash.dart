import 'package:flutter/material.dart';
import 'package:gfitness/Screens/OnBoardingScreens/OnBoarding.dart';

import '../MyColors.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //late BottomLoader bl;




  @override
  Widget build(BuildContext context) {


    Future.delayed(const Duration(seconds:10),(){

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>OnBoarding(),
        ),
            (route) =>false,
      );

    });
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: MyColors.black,

            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png',height: 500,),




              ],
            ),
          ),
        ),
      ),
    );
  }


}