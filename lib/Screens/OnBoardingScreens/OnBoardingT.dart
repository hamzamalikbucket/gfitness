import 'package:flutter/material.dart';
import 'package:gfitness/Screens/OnBoardingScreens/OnBoardingL.dart';

import '../../MyColors.dart';
import '../../Utils.dart';
import '../../widgets/BtnNullHeightWidth.dart';
import '../../widgets/TextWidget.dart';

class OnBoardingT extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WeState();
  }

}
class WeState extends State<OnBoardingT>{
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
                        image: AssetImage('assets/images/onbt.png'),
                        fit: BoxFit.cover,

                      ),
                    ),
                    child: Column(
                        children: const [])),
                TextWidget(
                    input: "  Get WorkOut Information \n" "START YOUR JOURNEY",
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
                          builder: (BuildContext context) =>OnBoardingL()
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