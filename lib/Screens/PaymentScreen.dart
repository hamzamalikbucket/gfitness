import 'package:flutter/material.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'dart:io';
import 'package:intl/intl.dart';


class PaymentScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return PayState();
  }

}
class PayState extends State<PaymentScreen>{
   String getCurrency() {
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName,);
  return format.currencySymbol;
  }
   String? radiovalue;
   bool monthRadiobutton = false;
   bool yearRadiobutton = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/payp.png'),
              fit: BoxFit.cover,
              opacity: 50,

            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Utils.APP_PADDING),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: [
               Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     TextWidget(
                         input: "Be,",
                         fontsize: 28,
                         fontWeight: FontWeight.w600,
                         textcolor: MyColors.whiteColor),
                     TextWidget(
                         input: "Premium",
                         fontsize: 28,
                         fontWeight: FontWeight.w600,
                         textcolor: MyColors.whiteColor),
                     TextWidget(
                         input: "Get Unlimited Access",
                         fontsize: 28,
                         fontWeight: FontWeight.w300,
                         textcolor: MyColors.whiteColor),
                     TextWidget(
                         input: "When you subscribe, you’ll get \n instant unlimited access free of ads",
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
                     Container(
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
                                   value: "Monthly",
                                   groupValue: radiovalue,
                                   activeColor: MyColors.orangeColor,

                                   onChanged: (value) {

                                     setState(() {
                                       radiovalue = value.toString();
                                       monthRadiobutton=true;
                                       yearRadiobutton=false;
                                     });
                                   }),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: [
                                     TextWidget(
                                         input: "Monthly",
                                         fontsize: 16,
                                         fontWeight:
                                         FontWeight.w600,
                                         textcolor: MyColors
                                             .whiteColor),
                                     TextWidget(
                                         input: "Pay monthly, cancel any time",
                                         fontsize: 9,
                                         fontWeight:
                                         FontWeight.w400,
                                         textcolor:( monthRadiobutton)? MyColors.orangeColor:MyColors.whiteColor,)
                                   ],
                                 ),
                               ),


                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: TextWidget(
                                     input: getCurrency().toString()+"5.00/month",
                                     fontsize: 16,
                                     fontWeight:
                                     FontWeight.w600,
                                     textcolor: MyColors
                                         .whiteColor),
                               ),

                             ],
                           ),
                         ],
                       ),
                     ),
                     Utils.FORM_HINT_PADDING,

                     Container(
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
                                   value: "Yearly",
                                   groupValue: radiovalue,
                                   activeColor: MyColors.orangeColor,
                                   onChanged: (value) {

                                     setState(() {
                                       radiovalue = value.toString();
                                       yearRadiobutton=true;
                                       monthRadiobutton=false;
                                     });
                                   }),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: [
                                     TextWidget(
                                         input: "Yearly",
                                         fontsize: 16,
                                         fontWeight:
                                         FontWeight.w600,
                                         textcolor: MyColors
                                             .whiteColor),
                                     TextWidget(
                                         input: "Pay for a full yearly basis and enjoy",
                                         fontsize: 9,
                                         fontWeight:
                                         FontWeight.w400,
                                         textcolor:(yearRadiobutton)? MyColors.orangeColor:MyColors.whiteColor,)
                                   ],
                                 ),
                               ),


                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: TextWidget(
                                     input: getCurrency().toString()+"55.00/year",
                                     fontsize: 16,
                                     fontWeight:
                                     FontWeight.w600,
                                     textcolor: MyColors
                                         .whiteColor),
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
                           title: "Subscribe  Now",
                           bgcolour: MyColors.orangeColor,
                           textcolour: MyColors.whiteColor,
                           onPress: () {


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
    );
  }

}