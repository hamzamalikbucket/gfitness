import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gfitness/Constants.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/authentication.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class ChooserScreen extends StatefulWidget{
  const ChooserScreen({super.key});



  @override
  State<StatefulWidget> createState() {
    return PState();
  }


}
class PState extends State<ChooserScreen>{
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName,);
    return format.currencySymbol;
  }
  String? radiovalue;
  bool notActive = false;
  bool ActiveJob = false;
  bool LightExcer = false;
  bool ModerateExcer = false;
  bool ActiveDaily = false;
  bool veryActive = false;
  bool extraActive = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MyColors.black,

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Utils.APP_PADDING),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TextWidget(
                            input: "Choose Your Activity",
                            fontsize: 25,
                            fontWeight: FontWeight.w500,
                            textcolor: MyColors.whiteColor),
                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [

                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,
                        Container  (
                          width: MediaQuery.of(context).size.width,
                          height: 74,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: MyColors.blackColor48,
                              borderRadius:
                              BorderRadius.all(
                                Radius.circular(17.0),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,

                            children: [
                              Radio(
                                  value: "Not active with office job",
                                  groupValue: radiovalue,
                                  activeColor: MyColors.orangeColor,


                                  onChanged: (value) {
                                    setState(() {
                                      radiovalue = value.toString();
                                      LightExcer=false;
                                      notActive=true;
                                      ActiveJob=false;
                                      ModerateExcer = false;
                                      ActiveDaily = false;
                                       veryActive = false;
                                      extraActive = false;

                                    });
                                  }),
                              TextWidget(
                                  input:"Not active with office job",
                                  fontsize: 15,
                                  fontWeight:
                                  FontWeight.w600,
                                  textcolor: MyColors
                                      .whiteColor),



                            ],
                          ),
                        ),
                        Utils.FORM_HINT_PADDING,
                        Container  (
                          width: MediaQuery.of(context).size.width,
                          height: 74,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: MyColors.blackColor48,
                              borderRadius:
                              BorderRadius.all(
                                Radius.circular(17.0),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,

                            children: [
                              Radio(
                                  value: "active job no exercise",
                                  groupValue: radiovalue,
                                  activeColor: MyColors.orangeColor,


                                  onChanged: (value) {
                                    setState(() {
                                      radiovalue = value.toString();
                                      LightExcer=false;
                                      notActive=false;
                                      ActiveJob=true;
                                      ModerateExcer = false;
                                      ActiveDaily = false;
                                      veryActive = false;
                                      extraActive = false;

                                    });
                                  }),
                              TextWidget(
                                  input:"Active job no exercise",
                                  fontsize: 15,
                                  fontWeight:
                                  FontWeight.w600,
                                  textcolor: MyColors
                                      .whiteColor),



                            ],
                          ),
                        ),
                        Utils.FORM_HINT_PADDING,
                        Container  (
                          width: MediaQuery.of(context).size.width,
                          height: 74,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: MyColors.blackColor48,
                              borderRadius:
                              BorderRadius.all(
                                Radius.circular(17.0),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,

                            children: [
                              Radio(
                                  value: "Light exercise 1-3 times a week",
                                  groupValue: radiovalue,
                                  activeColor: MyColors.orangeColor,


                                  onChanged: (value) {
                                    setState(() {
                                      radiovalue = value.toString();
                                      LightExcer=true;
                                      notActive=false;
                                      ActiveJob=false;
                                      ModerateExcer = false;
                                      ActiveDaily = false;
                                      veryActive = false;
                                      extraActive = false;

                                    });
                                  }),
                              TextWidget(
                                  input:"Light exercise 1-3 times a week",
                                  fontsize: 15,
                                  fontWeight:
                                  FontWeight.w600,
                                  textcolor: MyColors
                                      .whiteColor),



                            ],
                          ),
                        ),
                        Utils.FORM_HINT_PADDING,
                        Container  (
                          width: MediaQuery.of(context).size.width,
                          height: 74,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: MyColors.blackColor48,
                              borderRadius:
                              BorderRadius.all(
                                Radius.circular(17.0),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,

                            children: [
                              Radio(
                                  value: "Moderate 4-5 times a week",
                                  groupValue: radiovalue,
                                  activeColor: MyColors.orangeColor,


                                  onChanged: (value) {
                                    setState(() {
                                      radiovalue = value.toString();
                                      LightExcer=false;
                                      notActive=false;
                                      ActiveJob=false;
                                      ModerateExcer = true;
                                      ActiveDaily = false;
                                      veryActive = false;
                                      extraActive = false;

                                    });
                                  }),
                              TextWidget(
                                  input:"Moderate 4-5 times a week",
                                  fontsize: 15,
                                  fontWeight:
                                  FontWeight.w600,
                                  textcolor: MyColors
                                      .whiteColor),



                            ],
                          ),
                        ),
                        Utils.FORM_HINT_PADDING,
                        Container  (
                          width: MediaQuery.of(context).size.width,
                          height: 74,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: MyColors.blackColor48,
                              borderRadius:
                              BorderRadius.all(
                                Radius.circular(17.0),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,

                            children: [
                              Radio(
                                  value: "active daily exercise",
                                  groupValue: radiovalue,
                                  activeColor: MyColors.orangeColor,


                                  onChanged: (value) {
                                    setState(() {
                                      radiovalue = value.toString();
                                      LightExcer=false;
                                      notActive=false;
                                      ActiveJob=false;
                                      ModerateExcer = false;
                                      ActiveDaily = true;
                                      veryActive = false;
                                      extraActive = false;

                                    });
                                  }),
                              TextWidget(
                                  input:"Active daily exercise",
                                  fontsize: 15,
                                  fontWeight:
                                  FontWeight.w600,
                                  textcolor: MyColors
                                      .whiteColor),



                            ],
                          ),
                        ),
                        Utils.FORM_HINT_PADDING,
                        Container  (
                          width: MediaQuery.of(context).size.width,
                          height: 74,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: MyColors.blackColor48,
                              borderRadius:
                              BorderRadius.all(
                                Radius.circular(17.0),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,

                            children: [
                              Radio(
                                  value: "very active daily intense exercise",
                                  groupValue: radiovalue,
                                  activeColor: MyColors.orangeColor,


                                  onChanged: (value) {
                                    setState(() {
                                      radiovalue = value.toString();
                                      LightExcer=false;
                                      notActive=false;
                                      ActiveJob=false;
                                      ModerateExcer = false;
                                      ActiveDaily = false;
                                      veryActive = true;
                                      extraActive = false;

                                    });
                                  }),
                              TextWidget(
                                  input:"Very active daily intense exercise",
                                  fontsize: 15,
                                  fontWeight:
                                  FontWeight.w600,
                                  textcolor: MyColors
                                      .whiteColor),



                            ],
                          ),
                        ),
                        Utils.FORM_HINT_PADDING,
                        Container  (
                          width: MediaQuery.of(context).size.width,
                          height: 74,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: MyColors.blackColor48,
                              borderRadius:
                              BorderRadius.all(
                                Radius.circular(17.0),
                              )),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,

                            children: [
                              Radio(
                                  value: "extra active daily physical job or very intense daily exercise",
                                  groupValue: radiovalue,
                                  activeColor: MyColors.orangeColor,


                                  onChanged: (value) {
                                    setState(() {
                                      radiovalue = value.toString();
                                      LightExcer=false;
                                      notActive=false;
                                      ActiveJob=false;
                                      ModerateExcer = false;
                                      ActiveDaily = false;
                                      veryActive = false;
                                      extraActive = true;

                                    });
                                  }),
                              TextWidget(
                                  input:"extra active daily physical job or \n very intense daily exercise",
                                  fontsize: 15,
                                  fontWeight:
                                  FontWeight.w600,
                                  textcolor: MyColors
                                      .whiteColor),



                            ],
                          ),
                        ),



                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,


                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
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
                            onPress: () async {
                              print(radiovalue);

                              if(radiovalue!=null) {
                                Utils.user_activity=radiovalue!;
                                Navigator.pushNamed(context, Constants.goalScreen);

                              }else{

                                ScaffoldMessenger.of(context).showSnackBar(
                                  Authentication.customSnackBar(
                                    content: 'Please Choose activity',
                                  ),
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
      ),
    );
  }
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }


}