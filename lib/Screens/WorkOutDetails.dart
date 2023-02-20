import 'package:flutter/material.dart';
import 'package:gfitness/Models/WorkoutModel.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';
import 'package:gfitness/AdHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WorkOutDetails extends StatefulWidget{
  const WorkOutDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WoState();
  }

}
class WoState extends State<WorkOutDetails>{
  late WorkoutModel workoutModel;
  BannerAd? _bannerAd,bannerAd2;

  @override
  void initState() {
    // TODO: implement initState

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
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            bannerAd2 = ad as BannerAd;

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
    workoutModel=ModalRoute.of(context)!.settings.arguments as WorkoutModel;
    // TODO: implement build
    return Scaffold(
      appBar:ToolbarBack(appBar: AppBar(), title: "Back"),
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


                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        workoutModel.image1,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [],
                  ),
                ),
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        workoutModel.image2,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [],
                  ),
                ),
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        workoutModel.image3,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: 200,
                  width: MediaQuery.of(context).size.width,

                  child: Column(
                    children: [],
                  ),
                ),
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,

                if (bannerAd2 != null)
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: _bannerAd!.size.width.toDouble(),
                      height: _bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: bannerAd2!),
                    ),
                  ),


                TextWidget(
                    input: "Follow these Steps,",
                    fontsize: 20,
                    fontWeight: FontWeight.w600,
                    textcolor: MyColors.whiteColor),
                TextWidget(
                    input: "Burn Calories, enjoy your workout",
                    fontsize: 13,
                    fontWeight: FontWeight.w400,
                    textcolor: MyColors.orangeColor),
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                Container(
                  width: 80,
                  height: 26,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: MyColors.orangeColor,
                      borderRadius:
                      BorderRadius.all(
                        Radius.circular(17.0),
                      )),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_circle,
                        color:
                        MyColors.whiteColor,
                        size: 13,
                      ),
                      TextWidget(
                          input: "60 min",
                          fontsize: 13,
                          fontWeight:
                          FontWeight.w400,
                          textcolor: MyColors
                              .whiteColor),
                    ],
                  ),
                ),
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                TextWidget(
                    input: workoutModel.description,
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