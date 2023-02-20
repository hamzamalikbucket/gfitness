import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/authentication.dart';
import 'package:gfitness/widgets/BtnImg.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';

import 'NavigationScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> _SignKey = GlobalKey<FormState>();

  bool _isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:ToolbarBack(appBar: AppBar(

      ), title: ""),
      body: SafeArea(
        child:
    Container(
          color: MyColors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(Utils.APP_PADDING),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/notextlogo.png',
                        height: 250,
                        width: 250,
                      ),
                      TextWidget(
                          input: "Login",
                          fontsize: 28,
                          fontWeight: FontWeight.w700,
                          textcolor: MyColors.whiteColor),
                      TextWidget(
                          input: "Use your credentials for a better experience",
                          fontsize: 13,
                          fontWeight: FontWeight.w400,
                          textcolor: MyColors.whiteColor),
                    ],
                  ),
                ),
                Utils.FORM_HINT_PADDING,

                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return

                        BtnImg(
                          title: "Sign In with Google",
                          bgcolour: MyColors.orangeColor,
                          textcolour: MyColors.whiteColor,
                          onPress: () async {
                            setState(() {
                              _isSigningIn = true;
                            });

                            User? user = await Authentication.signInWithGoogle(
                                context: context);
                            Utils.USER_First_NAME=user!.displayName!;
                            Utils.USER_ID=user.uid;
                            print(user.uid);


                            setState(() {
                              _isSigningIn = false;
                            });
                            if (user != null) {
                              Navigator.pop(context);
                           /*   Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      NavigationScreen(),
                                ),
                                (route) => false,
                              );*/
                            }
                          },
                          ImagePath: 'assets/images/googlelogo.png');
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
}
