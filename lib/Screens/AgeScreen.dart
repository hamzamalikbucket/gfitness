import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:gfitness/Constants.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';


class AgeScreen extends StatefulWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AgeState();
  }
}

class AgeState extends State<AgeScreen> {


  @override
  void initState() {
    setState(() {
      Utils.User_DOB = "Null";
    });
    // TODO: implement initState
    super.initState();
  }
  var age =18;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MyColors.black,
          child: Padding(
            padding: const EdgeInsets.all(Utils.APP_PADDING),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    TextWidget(
                        input: "How old are you ?",
                        fontsize: 28,
                        fontWeight: FontWeight.w600,
                        textcolor: MyColors.whiteColor),
                    TextWidget(
                        input: "This helps us create your personalized plan",
                        fontsize: 13,
                        fontWeight: FontWeight.w400,
                        textcolor: MyColors.whiteColor),
                  ],
                ),

                Expanded(

                  child: NumberPicker(
                    value: age,
                    minValue: 0,
                    maxValue: 150,
                    step: 1,
                    itemCount: 5,
                    itemHeight: 65,
                    textStyle: TextStyle(color: MyColors.whiteColor,fontSize: 42,fontWeight: FontWeight.w400),
                    selectedTextStyle: TextStyle(color: MyColors.orangeColor,fontSize: 58,fontWeight: FontWeight.w600),
                    haptics: true,
                    decoration: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3,color: MyColors.orangeColor),

                    ),

                    onChanged: (value) {

                      setState(() {
                        age = value;
                        Utils.User_DOB=age.toString();
                      }
                      );},
                  ),
                ),



                Align(
                  alignment: Alignment.bottomCenter,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/images/backButton.png",
                        ),
                        iconSize: 80,
                        color: MyColors.yellowColor,
                      ),
                      BtnNullHeightWidth(
                          title: "Next",
                          bgcolour: MyColors.orangeColor,
                          textcolour: MyColors.whiteColor,
                          onPress: () {
                            if (Utils.User_DOB == "Null") {

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please Select Your Age"),

                                ),

                              );
                            } else {
                            Navigator.pushNamed(
                                context,
                                Constants.heightScreen
                            );

                            }


                          },
                          width: 120,
                          height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}