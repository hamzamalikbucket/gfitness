 import 'package:flutter/material.dart';

import '../MyColors.dart';
import 'package:email_validator/email_validator.dart';


class EmailInputWidget extends StatelessWidget {
  String title;
  late Color hintcolour;
  bool isPassword = false;
  bool validate = true;
  TextInputType keyboardType = TextInputType.text;
  ValueChanged<String?> value;
  bool isRequired = false;
  String? error;
  IconData? icon;

  double width;
  TextEditingController? controller;


  EmailInputWidget(
      {Key? key,
        required this.title,
        required this.isRequired,
        required this.keyboardType,
        required this.value,
        required this.width,
        required this.validate,
        required this.isPassword,
        this.controller,
        this.icon,
        this.error,
        required this.hintcolour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,

      showCursor: true,
      obscureText: isPassword,
      style: TextStyle(color:MyColors.whiteColor),
      textInputAction: TextInputAction.done,
      keyboardType: keyboardType,

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

          labelStyle:TextStyle(color: MyColors.orangeColor) ,
          hintStyle: TextStyle(color: MyColors.whiteColor),

          hintText: title,

            labelText: title,
         ),
      validator: (value) {
        if (validate || value!.isEmpty) {
          return EmailValidator.validate(value!) ? null : 'Please enter valid ' + title;


        }
      },
      onSaved: value,
    );
  }
}