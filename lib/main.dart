import 'package:flutter/material.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Screens/AgeScreen.dart';
import 'package:gfitness/Screens/BookForm.dart';
import 'package:gfitness/Screens/CardPaymentScree.dart';
import 'package:gfitness/Screens/ChooserScreen.dart';
import 'package:gfitness/Screens/EmailMealPlanScreen.dart';
import 'package:gfitness/Screens/FitnessTermsScreen.dart';
import 'package:gfitness/Screens/GenderScreen.dart';
import 'package:gfitness/Screens/GoalsScreen.dart';
import 'package:gfitness/Screens/HeightScreen.dart';
import 'package:gfitness/Screens/LoginScreen.dart';
import 'package:gfitness/Screens/PayAppointment.dart';
import 'package:gfitness/Screens/PayMealPlan.dart';
import 'package:gfitness/Screens/QuestionScreen.dart';
import 'package:gfitness/Screens/Splash.dart';
import 'package:gfitness/Screens/StayHealthyScreen.dart';
import 'package:gfitness/Screens/SupplementsScreen.dart';
import 'package:gfitness/Screens/WorkOutScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G Fitness',
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.syneTextTheme(),
        disabledColor: MyColors.whiteColor,
        unselectedWidgetColor: MyColors.whiteColor,


        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
        initialRoute: Constants.Splash,

        routes: {
          Constants.Splash: (context) =>Splash(),
          Constants.login_screen: (context) =>Login(),

          Constants.work_out_screen: (context) =>WorkOutScreen(),
          Constants.pay_appointment: (context) =>PayAppointment(),
          Constants.booking_app_form: (context) =>BookForm(),
          Constants.pay_meal_plan: (context) =>PayMealPlan(),
          Constants.gender_screen: (context) =>GenderScreen(),
          Constants.ageScreen: (context) =>AgeScreen(),
          Constants.heightScreen: (context) =>HeightScreen(),
          Constants.healthyScreen: (context) =>StayHealthyScreen(),
          Constants.qAScreen: (context) =>QuestionScreen(),
          Constants.supplementScreen: (context) =>SupplementsScreen(),
          Constants.fitnessTerms: (context) =>FitnessTermsScreen(),
          Constants.chooserScreen: (context) =>ChooserScreen(),
          Constants.goalScreen: (context) =>GoalsScreen(),
          Constants.mailMealPlanScreen: (context) =>EmailMealPlanScreen(),
          Constants.cardPayment: (context) =>CardPaymentScreen(),












        }

    );
  }
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }
}


