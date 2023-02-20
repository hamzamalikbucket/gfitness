import 'package:flutter/material.dart';
import 'package:gfitness/Screens/LoginScreen.dart';
import 'package:gfitness/Screens/NavigationScreen.dart';

import '../../MyColors.dart';
import '../../Utils.dart';
import '../../widgets/BtnNullHeightWidth.dart';
import '../../widgets/TextWidget.dart';

class OnBoardingL extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WeState();
  }

}
class WeState extends State<OnBoardingL>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child:
          Center(child:
          Container(
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
                        image: AssetImage('assets/images/onbs.png'),
                        fit: BoxFit.cover,

                      ),
                    ),
                    child: Column(
                        children: const [])),
                TextWidget(
                    input: "  Book Your Appointments \n" "START YOUR EXPLORING",
                    fontsize: 24,
                    fontWeight: FontWeight.w700,
                    textcolor: MyColors.whiteColor),
                BtnNullHeightWidth(
                    title: "Start Now",
                    bgcolour: MyColors.orangeColor,
                    textcolour: MyColors.whiteColor,
                    onPress: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>NavigationScreen(),
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

          )
      ),



    );
  }


}