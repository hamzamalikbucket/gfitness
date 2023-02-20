import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';
import 'dart:io';
import 'package:intl/intl.dart';


class CardPaymentScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CardPayState();
  }

}
class CardPayState extends State<CardPaymentScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: ToolbarBack(appBar: AppBar(), title: "Card Payment Screens"),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MyColors.yellowColor,

          child: Padding(
            padding: const EdgeInsets.all(Utils.APP_PADDING),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextWidget(
                    input: "Get Access to trainers",
                    fontsize: 28,
                    fontWeight: FontWeight.w300,
                    textcolor: MyColors.whiteColor),
                CardFormField(controller: CardFormEditController(),

                ),
                CardField(
                  onCardChanged: (card) {
                    print(card);
                  },
                ),
                BtnNullHeightWidth(
                    title: "Pay Now",
                    bgcolour: MyColors.orangeColor,
                    textcolour: MyColors.whiteColor,
                    onPress: () async {




                    },
                    width: MediaQuery.of(context).size.width,
                    height: 50),

              ],
            ),
          ),
        ),
      ),
    );

  }
}


