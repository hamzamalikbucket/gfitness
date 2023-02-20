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

class PayMealPlan extends StatefulWidget{
  const PayMealPlan({super.key});



  @override
  State<StatefulWidget> createState() {
    return MealState();
  }


}
class MealState extends State<PayMealPlan>{
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName,);
    return format.currencySymbol;
  }
  String? radiovalue;

  bool _10$plan = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:ToolbarBack(appBar: AppBar(

      ), title: "Payment"),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/rookp.png'),
              fit: BoxFit.cover,


            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Utils.APP_PADDING),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            input: "Feel,",
                            fontsize: 28,
                            fontWeight: FontWeight.w600,
                            textcolor: MyColors.whiteColor),
                        TextWidget(
                            input: "Premium",
                            fontsize: 28,
                            fontWeight: FontWeight.w600,
                            textcolor: MyColors.whiteColor),
                        TextWidget(
                            input: "Buy Meal Plans",
                            fontsize: 28,
                            fontWeight: FontWeight.w300,
                            textcolor: MyColors.whiteColor),
                        TextWidget(
                            input: "When you choose plan, you’ll get \n instant responses via email provided",
                            fontsize: 13,
                            fontWeight: FontWeight.w400,
                            textcolor: MyColors.orangeColor),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Radio(
                                      value: "10",
                                      groupValue: radiovalue,
                                      activeColor: MyColors.orangeColor,
                                      onChanged: (value) {
                                        setState(() {
                                          radiovalue = value.toString();
                                          _10$plan=true;


                                        });
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        TextWidget(
                                            input: "7 days Meal plan",
                                            fontsize: 15,
                                            fontWeight:
                                            FontWeight.w600,
                                            textcolor: MyColors
                                                .whiteColor),
                                        TextWidget(
                                          input: "You can repeat it for 4 to 8 weeks",
                                          fontsize: 10,
                                          fontWeight:
                                          FontWeight.w600,
                                          textcolor:(_10$plan)? MyColors.orangeColor:MyColors.whiteColor,)
                                      ],
                                    ),
                                  ),


                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextWidget(
                                          input: getCurrency().toString()+"10",
                                          fontsize: 16,
                                          fontWeight:
                                          FontWeight.w600,
                                          textcolor: MyColors
                                              .whiteColor),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),




                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,
                        Utils.FORM_HINT_PADDING,

                        Align(
                          alignment:Alignment.bottomCenter,
                          child: BtnNullHeightWidth(
                              title: "Pay Now",
                              bgcolour: MyColors.orangeColor,
                              textcolour: MyColors.whiteColor,
                              onPress: () async {
                                print(radiovalue);
                                if(radiovalue!=null) {

                                  FirebaseApp firebaseApp = await Firebase
                                      .initializeApp();
                                  User? user = FirebaseAuth.instance
                                      .currentUser;
                                  if (user != null) {
                                    Navigator.pushNamed(
                                        context,
                                        Constants.gender_screen
                                    );
                                  } else {
                                    Navigator.pushNamed(
                                        context,
                                        Constants.login_screen
                                    );
                                  }
                                }else{

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    Authentication.customSnackBar(
                                      content: 'Please Chosoe a plan',
                                    ),
                                  );

                                }




                              },
                              width: MediaQuery.of(context).size.width,
                              height: 50),
                        ),
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


}