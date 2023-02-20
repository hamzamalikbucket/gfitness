import 'package:flutter/material.dart';
import 'package:gfitness/Models/WorkoutModel.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return qState();
  }

}
class qState extends State<QuestionScreen>{
  String data='';

  fetchFileData() async{
    String responsetext;
    responsetext=await rootBundle.loadString("assets/images/qa.txt");
    setState(() {
      data=responsetext;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    fetchFileData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Scaffold(
      appBar:ToolbarBack(appBar: AppBar(), title: "Question & Answers"),
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