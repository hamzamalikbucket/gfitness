import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gfitness/Constants.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/authentication.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class PayAppointment extends StatefulWidget{
  const PayAppointment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return PState();
  }


}
class PState extends State<PayAppointment>{
  @override
  void initState() {
    // TODO: implement initState

    WidgetsFlutterBinding.ensureInitialized();

    // set the publishable key for Stripe - this is mandatory
    Stripe.publishableKey = Utils.stripePublishableKey;
    super.initState();
  }
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName,);
    return format.currencySymbol;
  }
  String? radiovalue;
  bool askQ = false;
  bool _60MinChat = false;
  bool _30MinChat = false;
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
                            input: "Get Access to trainers",
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
                                      value: "1 hour",
                                      groupValue: radiovalue,
                                      activeColor: MyColors.orangeColor,


                                      onChanged: (value) {
                                        setState(() {
                                          radiovalue = value.toString();
                                          _30MinChat=false;
                                          askQ=false;
                                          _60MinChat=true;

                                        });
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            input:"1 hour Call with brian",
                                            fontsize: 15,
                                            fontWeight:
                                            FontWeight.w600,
                                            textcolor: MyColors
                                                .whiteColor),
                                        TextWidget(
                                          input:"Pay for an Hour Call",
                                          fontsize: 10,
                                          fontWeight:
                                          FontWeight.w600,
                                          textcolor:(_60MinChat)? MyColors.orangeColor:MyColors.whiteColor,)
                                      ],
                                    ),
                                  ),


                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextWidget(
                                          input: getCurrency().toString()+"100",
                                          fontsize: 16,
                                          fontWeight:
                                          FontWeight.w500,
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
                                      value: "30 min",
                                      groupValue: radiovalue,
                                      activeColor: MyColors.orangeColor,
                                      onChanged: (value) {
                                        setState(() {
                                          radiovalue = value.toString();
                                          _30MinChat=true;
                                          askQ=false;
                                          _60MinChat=false;

                                        });
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            input:"30 min. Call with brian",
                                            fontsize: 15,
                                            fontWeight:
                                            FontWeight.w600,
                                            textcolor: MyColors
                                                .whiteColor),
                                        TextWidget(
                                          input:"Pay for a 30 minute Call",
                                          fontsize: 10,
                                          fontWeight:
                                          FontWeight.w600,
                                          textcolor:(_30MinChat)? MyColors.orangeColor:MyColors.whiteColor,)
                                      ],
                                    ),
                                  ),


                                  Expanded(

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextWidget(
                                          input: getCurrency().toString()+"60",
                                          fontsize: 16,
                                          fontWeight:
                                          FontWeight.w400,
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
                          child:
                          BtnNullHeightWidth(
                              title: "Pay Now",
                              bgcolour: MyColors.orangeColor,
                              textcolour: MyColors.whiteColor,
                              onPress: () async {
                                print(radiovalue);

                                if(radiovalue!=null) {
                                  //Navigator.pushNamed(context, Constants.booking_app_form);
                                  FirebaseApp firebaseApp = await Firebase
                                      .initializeApp();
                                  User? user = FirebaseAuth.instance
                                      .currentUser;
                                  if (user != null) {
                                    Navigator.pushNamed(
                                        context,
                                        Constants.cardPayment,
                                    );
                                  } else {
                                    Navigator.pushNamed(
                                        context,
                                        Constants.login_screen
                                    );
                                  };
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