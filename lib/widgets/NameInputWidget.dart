import 'dart:ui';

import 'package:flutter/material.dart';

import '../MyColors.dart';
import 'package:fluttertoast/fluttertoast.dart';


class NameInputWidget extends StatelessWidget {
  String title;
  late Color hintcolour;
  Color? errorcolor;
  bool isPassword = false;


  bool validate = true;
  TextInputType keyboardType = TextInputType.text;
  ValueChanged<String?> value;
  bool isRequired = false;
  String? error;
  TextEditingController? controller;

  double width;
  IconData? icon;


  NameInputWidget(
      {Key? key,
        required this.title,
        required this.isRequired,
        required this.keyboardType,
        required this.value,
        required this.width,
        required this.validate,
        required this.isPassword,
        required this.hintcolour,
        this.error,
        this.errorcolor,
        this.icon,
        this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      obscureText: isPassword,
      textInputAction: TextInputAction.done,
      keyboardType: keyboardType,
      style: TextStyle(color:MyColors.whiteColor),


      decoration: InputDecoration(


          prefixIcon: Icon(
            icon,

            color:MyColors.whiteColor,
          ),

          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.gray),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.gray),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.gray),
          ),
          hintText: title,
          labelText: title,
          labelStyle:TextStyle(color: MyColors.orangeColor) ,
          hintStyle: TextStyle(color: MyColors.whiteColor),


          errorStyle: TextStyle(
            color:errorcolor,
          ),
),
      validator: (value) {
        if (validate && value!.length<1) {
          return error;



        }
      },
      onSaved: value,
    );
  }
}