import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:gfitness/Constants.dart';
import 'package:gfitness/Models/AppointModel.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/BtnNullHeightWidth.dart';
import 'package:gfitness/widgets/EmailInputWidget.dart';
import 'package:gfitness/widgets/NameInputWidget.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';

class BookForm extends StatefulWidget {
  const BookForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BookState();
  }
}

class BookState extends State<BookForm> {
  final GlobalKey<FormState> _SignKey = GlobalKey<FormState>();
  late String email, name, message;
  late AppointModel appointModel;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: ToolbarBack(appBar: AppBar(), title: "Query"),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MyColors.black,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextWidget(
                      input: "Enter your information below to proceed",
                      fontsize: 25,
                      fontWeight: FontWeight.w300,
                      textcolor: MyColors.whiteColor),
                ),
                Padding(
                  padding: const EdgeInsets.all(Utils.APP_PADDING),

                  child: form(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget form(BuildContext context) {
    return Form(
        key: _SignKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            EmailInputWidget(
                title: "Email",
                error: "Enter Valid Email",
                isRequired: true,
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                value: (val) {
                  email = val!;
                },
                width: MediaQuery.of(context).size.width,
                validate: true,
                isPassword: false,
                hintcolour: MyColors.whiteColor),
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            NameInputWidget(
                title: "Name",
                error: "Enter your name",
                isRequired: true,
                icon: Icons.person,
                keyboardType: TextInputType.text,
                value: (val) {
                  name = val!;
                },
                width: MediaQuery.of(context).size.width,
                validate: true,
                isPassword: false,
                hintcolour: MyColors.whiteColor),
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            TextFormField(
              style: TextStyle(color: MyColors.whiteColor),
              decoration: InputDecoration(
                fillColor: MyColors.conblack,
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),


                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.gray),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.gray),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.gray),

                  ),

                  hintText: "Question",
                  labelText: "Question",
                  labelStyle: TextStyle(color: MyColors.orangeColor),
                  hintStyle: TextStyle(color: MyColors.whiteColor)),
              maxLines: 13,
              obscureText: false,
              validator: (password) {
                if (password!.isEmpty) {
                  return 'Message is empty';
                }
              },
              onSaved: (value) {
                message = value!;
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            BtnNullHeightWidth(
              title: "Proceed",
              bgcolour: MyColors.orangeColor,
              textcolour: MyColors.whiteColor,
              onPress: () {
                //(is_teacher)?Navigator.pushReplacementNamed(context, Constants.signup_page),
                final form = _SignKey.currentState;
                form!.save();
                if (form.validate()) {
                  //Navigator.pushNamed(context, Constants.pay_appointment);
                  send();
                }
              },
              width: MediaQuery.of(context).size.width,
              height: 48,
            ),
          ],
        ));
  }

  Future<void> send() async {
    final Email Semail = Email(
      body:"Name:$name\nCustomer Email:$email\nAsking Question:$message",
      subject: message.toString(),
      recipients: [Utils.Email_Recipeint.toString()],
      /*attachmentPaths: attachments,*/
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(Semail);
      platformResponse = 'Check your email for the response with 24-48 hours';
      Navigator.pop(context);

    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;


    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
        content: Text(platformResponse),

      ),

    );
    Navigator.pop(context);


  }




}
