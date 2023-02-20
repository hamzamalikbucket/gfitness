import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gfitness/Screens/WorkOutScreen.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:jiffy/jiffy.dart';
import 'package:gfitness/AdHelper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


import '../Models/CategoryModel.dart';
import '../MyColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<HomeScreen> with WidgetsBindingObserver{
  BannerAd? _bannerAd;



  DateTime nowDate = DateTime.now();
  late String date;


  List<CategoryModel> catlist = [
    CategoryModel("1", "assets/images/catbiceps.png", "Biceps"),
    CategoryModel("2", "assets/images/chest.png", "Chest"),
    CategoryModel("3", "assets/images/lowerb.png", "Power Lifting"),
  ];
  bool _play = true;



  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addObserver(this);
    date = Jiffy(nowDate).format('MMM do yy');
    // TODO: Load a banner ad
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
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // TODO: Dispose a BannerAd object
    _bannerAd?.dispose();
    super.dispose();
  }
/*  Future loadMusic() async {

    _assetsAudioPlayer.open(
      Audio("assets/images/bgsong.mp3"),
      autoStart: true,

      respectSilentMode: true,
      showNotification: true,
      playInBackground: PlayInBackground.enabled,
      audioFocusStrategy: const AudioFocusStrategy.request(
          resumeAfterInterruption: true,
          resumeOthersPlayersAfterDone: false),
      volume: 28.0,
 );


  }*/
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        //Play the Music
        setState(() {
          _play=true;
        });

        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        //Stop the music
        _play=false;
        setState(() {
          _play=false;
        });


        break;
        case AppLifecycleState.paused:
        print("app in paused");
        _play=false;
        setState(() {
          _play=false;
        });

        break;
      case AppLifecycleState.detached:
        print("app in detached");
        //Stop the music
        _play=false;
        setState(() {
          _play=false;
        });
       // _assetsAudioPlayer.dispose();
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/orangesqbg.png"), fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(right: Utils.APP_PADDING,left: Utils.APP_PADDING),
                child:
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize:MainAxisSize.max,

                    children: [
                      // TODO: Display a banner when ready
                      if (_bannerAd != null)
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: _bannerAd!.size.width.toDouble(),
                            height: _bannerAd!.size.height.toDouble(),
                            child: AdWidget(ad: _bannerAd!),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",height: 200,width: 280,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextWidget(
                              input: "G Fitness Home &",
                              fontsize:12,
                              fontWeight: FontWeight.w700,
                              textcolor: MyColors.whiteColor),

                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextWidget(
                              input: "Gym Bodybuilding Workouts",
                              fontsize:12,
                              fontWeight: FontWeight.w700,
                              textcolor: MyColors.whiteColor),
                        ],
                      ),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                              input: "Good To Have You Here",
                              fontsize: 15,
                              fontWeight: FontWeight.w400,
                              textcolor: MyColors.whiteColor),
                  AudioWidget.assets(
                    path: "assets/images/bgsong.mp3",
                    play: _play,

                    child: ElevatedButton(
                        child: Text(
                          _play ? "pause" : "play",
                        ),
                        onPressed: () {

                          setState(() {
                            _play = !_play;
                          });


                        }
                    ),
                    onFinished: (){
                      setState(() {
                        _play = !_play;
                      });


                    },
                    onReadyToPlay: (duration) {
                      //onReadyToPlay
                    },
                    onPositionChanged: (current, duration) {
                      //onPositionChanged
                    },
                  ),

                        ],
                      ),

                      Utils.FORM_HINT_PADDING,
                      Utils.FORM_HINT_PADDING,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                              input: "Your Workout Gallery",
                              fontsize: 17,
                              fontWeight: FontWeight.w600,
                              textcolor: MyColors.whiteColor),
                          TextWidget(
                              input:date,
                              fontsize: 17,
                              fontWeight: FontWeight.w600,
                              textcolor: MyColors.orangeColor),
                        ],
                      ),

                      ListView.builder(
                        itemCount: catlist.length,
                        addRepaintBoundaries: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,

                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          CategoryModel cd = catlist[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WorkOutScreen(),
                                  settings: RouteSettings(
                                    arguments: cd,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 190,
                              width: MediaQuery.of(context).size.width,
                              child:
                              Stack(
                                children:[
                                  Image.asset(cd.image,
                                    color: MyColors.gray
                                        .withOpacity(0.2),
                                    colorBlendMode: BlendMode.hue,height: 190,),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0, top: 39),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextWidget(
                                              input: cd.name,
                                              fontsize: 17,
                                              fontWeight: FontWeight.w600,
                                              textcolor:
                                              MyColors.whiteColor),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/vector.png",
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5),
                                                child: TextWidget(
                                                    input:
                                                    "Workout For every one",
                                                    fontsize: 13,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    textcolor: MyColors
                                                        .whiteColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
     ]                         ),

                            ),

                          );
                        },
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }


}

