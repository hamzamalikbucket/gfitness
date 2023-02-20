import 'package:flutter/material.dart';
import 'package:gfitness/Constants.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GState();
  }
}

class GState extends State<GenderScreen> {
  bool malePressed = false;
  bool femalePressed = false;

  @override
  void initState() {
    setState(() {
      Utils.userGender = "Null";
    });
    // TODO: implement initState
    super.initState();
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextWidget(
                    input: "Tell us about yourself!",
                    fontsize: 25,
                    fontWeight: FontWeight.w600,
                    textcolor: MyColors.whiteColor),
                TextWidget(
                    input: "To give you a better experience we need",
                    fontsize: 13,
                    fontWeight: FontWeight.w400,
                    textcolor: MyColors.whiteColor),
                TextWidget(
                    input: "to know your gender",
                    fontsize: 13,
                    fontWeight: FontWeight.w400,
                    textcolor: MyColors.whiteColor),
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                GestureDetector(
                  onTap: (){
                    setState(() {
                      malePressed = true;
                      femalePressed = false;
                      Utils.userGender = "Male";

                    });

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (malePressed)
                          ? MyColors.orangeColor
                          : MyColors.conblack,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              malePressed = true;
                              femalePressed = false;
                              Utils.userGender = "Male";

                            });
                          },
                          icon: (malePressed)
                              ? Image.asset(
                                  "assets/images/maleblack.png",
                                )
                              : Image.asset(
                                  "assets/images/malewhite.png",
                                ),
                          iconSize: 80,
                          color: MyColors.yellowColor,
                        ),
                        TextWidget(
                            input: "Male",
                            fontsize: 15,
                            fontWeight: FontWeight.w400,
                            textcolor: (malePressed)
                                ? MyColors.black
                                : MyColors.whiteColor),
                      ],
                    ),
                  ),
                ),
                Utils.FORM_HINT_PADDING,
                GestureDetector(
                  onTap: (){
                    setState(() {
                      femalePressed = true;
                      malePressed = false;
                      Utils.userGender = "Female";

                    });

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (femalePressed)
                          ? MyColors.orangeColor
                          : MyColors.conblack,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              femalePressed = true;
                              malePressed = false;
                              Utils.userGender = "Female";

                            });
                          },
                          icon: (femalePressed)
                              ? Image.asset(
                                  "assets/images/femaleblack.png",
                                )
                              : Image.asset(
                                  "assets/images/femalewhite.png",
                                ),
                          iconSize: 80,
                          color: MyColors.yellowColor,
                        ),
                        TextWidget(
                            input: "Female",
                            fontsize: 15,
                            fontWeight: FontWeight.w400,
                            textcolor: (femalePressed)
                                ? MyColors.black
                                : MyColors.whiteColor),
                      ],
                    ),
                  ),
                ),
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,


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
                            if (Utils.userGender == "Null") {
                              print("Nothing selected");

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Please Select Gender"),

                                  ),

                              );
                            } else {
                              print(Utils.userGender);
                            Navigator.pushNamed(
                                context,
                                Constants.ageScreen,
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
