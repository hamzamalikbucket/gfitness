import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:gfitness/Constants.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/NameInputWidget.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

enum HeightUnit { ft, cm }

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HeightScreenState();
  }
}

class _HeightScreenState extends State<HeightScreen> {
  HeightUnit selectedUnit = HeightUnit.ft;
  late String weight;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  int ft = 0;
  int inches = 0;
  String cm = "";
  final GlobalKey<FormState> HWformkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      Utils.userHeight = "Null";
    });
    super.initState();
  }

  cmToInches(inchess) {
    ft = inchess ~/ 12;
    inches = inchess % 12;
    print('$ft feet and $inches inches');
  }

  inchesToCm() {
    int inchesTotal = (ft * 12) + inches;
    cm = (inchesTotal * 2.54).toStringAsPrecision(5);
    heightController.text = cm;
    setState(() {
      Utils.userHeight=cm;
    });
  }

  void checkHeightUnit() {
    if (selectedUnit == HeightUnit.ft) {
      setState(() {
        int inchess = (double.parse(heightController.text) ~/ 2.54).toInt();
        cmToInches(inchess);
        heightController.text = '$ft\' $inches"';
        Utils.userHeight='$ft\' $inches"';

      });
    } else if (selectedUnit == HeightUnit.cm) {
      setState(() {
        print(heightController.text);
        inchesToCm();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MyColors.black,
          child: Form(
            key: HWformkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextWidget(
                        input: "What’s your height & Weight?",
                        fontsize: 25,
                        fontWeight: FontWeight.w500,
                        textcolor: MyColors.whiteColor),
                    TextWidget(
                        input: "This helps us create your personalized plan",
                        fontsize: 13,
                        fontWeight: FontWeight.w400,
                        textcolor: MyColors.whiteColor),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 168,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length<1) {
                            return "Required";



                          }
                        },
                        style:

                            TextStyle(color: MyColors.whiteColor, fontSize: 18,),

                        onTap: selectedUnit == HeightUnit.ft
                            ? () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 200,
                                        color: Colors.grey,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: CupertinoPicker(
                                                itemExtent: 32.0,
                                                onSelectedItemChanged:
                                                    (int index) {
                                                  print(index + 1);
                                                  setState(() {
                                                    ft = (index + 1);
                                                    heightController.text =
                                                        "$ft' $inches\"";
                                                  });
                                                },
                                                children:
                                                    List.generate(12, (index) {
                                                  return Center(
                                                    child: Text('${index + 1}'),
                                                  );
                                                }),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Center(
                                                    child: Text('ft',
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration.none,
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                        )))),
                                            Expanded(
                                              child: CupertinoPicker(
                                                itemExtent: 32.0,
                                                onSelectedItemChanged:
                                                    (int index) {
                                                  print(index);
                                                  setState(() {
                                                    inches = (index);
                                                    heightController.text =
                                                        "$ft' $inches\"";
                                                  });
                                                },
                                                children:
                                                    List.generate(12, (index) {
                                                  return Center(
                                                    child: Text('$index'),
                                                  );
                                                }),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Center(
                                                  child: Text('inches',
                                                      style: TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                      ))),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              }
                            : null,
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorColor: MyColors.orangeColor,
                        decoration: InputDecoration(

                          hintText:
                              selectedUnit == HeightUnit.ft ? "__' __\"" : '__',
                          hintStyle: TextStyle(color: MyColors.orangeColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.gray),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.gray),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.gray),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                        ],
                      ),
                    ),
                    SizedBox(width: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (heightController.text.isEmpty) {
                              selectedUnit = HeightUnit.ft;
                            } else {
                              selectedUnit = HeightUnit.ft;
                              checkHeightUnit();
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: selectedUnit == HeightUnit.ft
                                  ? MyColors.orangeColor
                                  : MyColors.nocolor,
                            ),
                            color: MyColors.nocolor,
                          ),
                          width: 31,
                          height: 31,
                          child: Center(
                              child: Text('ft',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: MyColors.orangeColor,
                                      fontWeight: FontWeight.w400))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (heightController.text.isEmpty) {
                              selectedUnit = HeightUnit.cm;
                            } else {
                              selectedUnit = HeightUnit.cm;
                              checkHeightUnit();
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: selectedUnit == HeightUnit.cm
                                  ? MyColors.orangeColor
                                  : MyColors.nocolor,
                            ),
                            color: MyColors.nocolor,
                          ),
                          width: 31,
                          height: 31,
                          child: Center(
                              child: Text('cm',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: MyColors.orangeColor,
                                      fontWeight: FontWeight.w400))),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: NameInputWidget(
                      title: "Weight with unit kg/lbs",
                      error: "Enter your weight",
                      controller: weightController,
                      isRequired: true,
                      icon: Icons.monitor_weight_outlined,
                      keyboardType: TextInputType.text,
                      value: (val) {
                        weight = val!;
                      },
                      width: MediaQuery.of(context).size.width,
                      validate: true,
                      isPassword: false,
                      hintcolour: MyColors.whiteColor),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/images/backButton.png",
                        ),
                        iconSize: 80,
                        color: MyColors.yellowColor,
                      ),
                      BtnNullHeightWidth(
                          title: "Next",
                          bgcolour: MyColors.orangeColor,
                          textcolour: MyColors.whiteColor,
                          onPress: () {
                            final form = HWformkey.currentState;
                            form!.save();
                            if (form.validate()) {
                              print(heightController.text.toString());
                              Utils.userHeight=heightController.text.toString();
                              Utils.userWeight=weightController.text.toString();
                              Navigator.pushNamed(context, Constants.chooserScreen);

                            }
                        /*    if (Utils.userHeight == "Null") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please enter values"),
                                ),
                              );
                            } else {
                              print("elsee mai hoo");
                              print(Utils.userHeight);

                            }*/
                          },
                          width: 120,
                          height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
