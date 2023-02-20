import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gfitness/Constants.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/AdHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InfoState();
  }
}

class InfoState extends State<InfoScreen> {
  InterstitialAd? _interstitialAd;

  // TODO: Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {

            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initStat
    // TODO: Load an Interstitial Ad
    if (_interstitialAd == null) {
      _loadInterstitialAd();
    }



    super.initState();
  }

  @override
  void dispose() {
    // TODO: Dispose an InterstitialAd object
    _interstitialAd?.dispose();

    super.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_interstitialAd != null) {
                      _interstitialAd?.show();
                    }

                      Navigator.pushNamed(
                        context,
                        Constants.healthyScreen,
                      );

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.health_and_safety,
                              size: 20.0,
                              color: MyColors.orangeColor,
                            ),
                          ),
                          TextWidget(
                            input: "Stay Healthy",
                            fontsize: 20,
                            fontWeight: FontWeight.normal,
                            textcolor: MyColors.whiteColor,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: MyColors.whiteColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: MyColors.gray,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Constants.fitnessTerms,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.fitness_center,
                              size: 20.0,
                              color: MyColors.orangeColor,
                            ),
                          ),
                          TextWidget(
                            input: "Fitness Terms",
                            fontsize: 20,
                            fontWeight: FontWeight.normal,
                            textcolor: MyColors.whiteColor,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: MyColors.whiteColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: MyColors.gray,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Constants.qAScreen,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.question_answer_outlined,
                              size: 20.0,
                              color: MyColors.orangeColor,
                            ),
                          ),
                          TextWidget(
                            input: "Q & A",
                            fontsize: 20,
                            fontWeight: FontWeight.normal,
                            textcolor: MyColors.whiteColor,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: MyColors.whiteColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: MyColors.gray,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Constants.supplementScreen,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.food_bank,
                              size: 20.0,
                              color: MyColors.orangeColor,
                            ),
                          ),
                          TextWidget(
                            input: "Supplements",
                            fontsize: 20,
                            fontWeight: FontWeight.normal,
                            textcolor: MyColors.whiteColor,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20.0,
                        color: MyColors.whiteColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: MyColors.gray,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
