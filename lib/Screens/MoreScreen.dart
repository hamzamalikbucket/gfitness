import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/authentication.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';
import 'package:share_plus/share_plus.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MoState();
  }
}

class MoState extends State<MoreScreen> {
  
  
  
  bool _isSigningOut = false;





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
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    _onShare(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.ios_share,
                                size: 20.0,
                                color: MyColors.orangeColor,
                              )),
                          TextWidget(
                            input: "Share App",
                            fontsize: 20,
                            fontWeight: FontWeight.normal,
                            textcolor: MyColors.whiteColor,
                          ),
                        ],
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
                    /* Navigator.pushNamed(
                          context,
                          Constants.checkout_shipping_screen,
                        );*/
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.star_rate,
                              size: 20.0,
                              color: MyColors.orangeColor,
                            ),
                          ),
                          TextWidget(
                            input: "Rate Us",
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
                    /* Navigator.pushNamed(
                          context,
                          Constants.checkout_shipping_screen,
                        );*/
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.rate_review,
                              size: 20.0,
                              color: MyColors.orangeColor,
                            ),
                          ),
                          TextWidget(
                            input: "FeedBack",
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
                    /* Navigator.pushNamed(
                          context,
                          Constants.checkout_shipping_screen,
                        );*/
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.report_gmailerrorred_outlined,
                              size: 20.0,
                              color: MyColors.orangeColor,
                            ),
                          ),
                          TextWidget(
                            input: "Report issue",
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
                    /* Navigator.pushNamed(
                          context,
                          Constants.checkout_shipping_screen,
                        );*/
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.policy,
                              size: 20.0,
                              color: MyColors.orangeColor,
                            ),
                          ),
                          TextWidget(
                            input: "Privacy Policy",
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
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      User? user= FirebaseAuth.instance.currentUser;
                      return

                        (user!=null)?
                        SizedBox(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    _isSigningOut = true;
                                    user=null;
                                  });


                                  await Authentication.signOut(context: context);
                                  setState(() {
                                    _isSigningOut = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    Authentication.customSnackBar(
                                      content: 'Successfully Logged Out',
                                    ),
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
                                            Icons.logout_outlined,
                                            size: 20.0,
                                            color: MyColors.orangeColor,
                                          ),
                                        ),
                                        TextWidget(
                                          input: "Log Out",
                                          fontsize: 20,
                                          fontWeight: FontWeight.normal,
                                          textcolor: MyColors.whiteColor,
                                        ),
                                      ],
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
                        ): Text("");
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        MyColors.orangeColor,
                      ),
                    );
                  },
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }

  _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final box = context.findRenderObject() as RenderBox?;

    await Share.share("Check out this application https://google.com",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
