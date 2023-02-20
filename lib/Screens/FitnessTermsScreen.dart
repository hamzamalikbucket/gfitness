import 'package:flutter/material.dart';
import 'package:gfitness/Models/WorkoutModel.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gfitness/AdHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FitnessTermsScreen extends StatefulWidget{
  const FitnessTermsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FitState();
  }

}
class FitState extends State<FitnessTermsScreen>{
  String data='';
  BannerAd? _bannerAd;

  fetchFileData() async{
    String responsetext;
    responsetext=await rootBundle.loadString("assets/images/fitnesstms.txt");
    setState(() {
      data=responsetext;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    fetchFileData();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
      appBar:ToolbarBack(appBar: AppBar(), title: "Fitness Terms"),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MyColors.black,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,


                children: [

                  if (_bannerAd != null)
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: _bannerAd!.size.width.toDouble(),
                        height: _bannerAd!.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd!),
                      ),
                    ),

                  TextWidget(
                      input: data,
                      fontsize: 15,
                      fontWeight: FontWeight.w400,
                      textcolor: MyColors.whiteColor),
                  Utils.FORM_HINT_PADDING,
                  Utils.FORM_HINT_PADDING,
                  Utils.FORM_HINT_PADDING,
                  Utils.FORM_HINT_PADDING,

                  Align(
                    alignment:Alignment.bottomCenter,
                    child: BtnNullHeightWidth(
                        title: "Close",
                        bgcolour: MyColors.orangeColor,
                        textcolour: MyColors.whiteColor,
                        onPress: () {
                          Navigator.pop(context);

                        },
                        width: 150,
                        height: 39),
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