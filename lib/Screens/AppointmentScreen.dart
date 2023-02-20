import 'package:flutter/material.dart';
import 'package:gfitness/Constants.dart';
import 'package:gfitness/Models/AppointModel.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Screens/BookForm.dart';
import 'package:gfitness/Screens/PayAppointment.dart';
import 'package:gfitness/Utils.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:gfitness/widgets/Toolbar.dart';

class AppointmentScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return AppoState();
  }

}
class AppoState extends State<AppointmentScreen>{
  List<AppointModel>appointlist=[
    AppointModel("10:00 am", "Tread", "29-08-2022"),
    AppointModel("10:00 am", "Jennifer James", "29-08-2022"),

  ];

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                     Navigator.pushNamed(
                          context,
                          Constants.pay_appointment,
                        );
                  /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayAppointment(),
                        settings: RouteSettings(

                        ),
                      ),
                    );*/
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 96,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: MyColors.conblack,
                        borderRadius:
                        const BorderRadius.all(
                          Radius.circular(16.0),
                        )),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                input: "Book Appointment to chat or talk with",
                                fontsize: 13,
                                fontWeight: FontWeight.normal,
                                textcolor: MyColors.whiteColor,
                              ),
                              TextWidget(
                                  input: "Brian",
                                  fontsize: 13,
                                  fontWeight: FontWeight.w400,
                                  textcolor: MyColors.whiteColor),
                              TextWidget(
                                  input: "The best certified personal trainer in Usa",
                                  fontsize: 11,
                                  fontWeight: FontWeight.w400,
                                  textcolor: MyColors.orangeColor),
                              TextWidget(
                                  input: "Questions Related to fitness , Diet and goals only",
                                  fontsize: 8,
                                  fontWeight: FontWeight.w600,
                                  textcolor: MyColors.orangeColor),
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
                  ),
                ),
                Utils.FORM_HINT_PADDING,
                Utils.FORM_HINT_PADDING,
                GestureDetector(
                  onTap: () {
                     Navigator.pushNamed(
                          context,
                          Constants.pay_meal_plan,
                        );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 96,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: MyColors.conblack,
                        borderRadius:
                        const BorderRadius.all(
                          Radius.circular(16.0),
                        )),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                input: "Buy Our Meal Plans",
                                fontsize: 13,
                                fontWeight: FontWeight.normal,
                                textcolor: MyColors.whiteColor,
                              ),
                              TextWidget(
                                  input: "Custom Meal Plans for you",
                                  fontsize: 13,
                                  fontWeight: FontWeight.w400,
                                  textcolor: MyColors.orangeColor),
                              TextWidget(
                                  input: "Plan for your need ",
                                  fontsize: 8,
                                  fontWeight: FontWeight.w400,
                                  textcolor: MyColors.orangeColor)

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
                  ),
                ),



              ],
            ),
          ),

        ),
      ),
    );
  }

}
/* ListView.builder(
              itemCount: appointlist.length,
              addRepaintBoundaries: true,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,

              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                AppointModel cd = appointlist[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayAppointment(),
                        settings: RouteSettings(

                        ),
                      ),
                    );


                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 74,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: MyColors.blackColor12,
                            borderRadius:
                            const BorderRadius.all(
                              Radius.circular(17.0),
                            )),
                      child:Padding(
                        padding: const EdgeInsets.only(left:15,top: 8),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   TextWidget(
                                       input: cd.Name,
                                       fontsize: 17,
                                       fontWeight: FontWeight.w600,
                                       textcolor: MyColors.whiteColor),
                                   TextWidget(
                                       input: "High Intensity Training",
                                       fontsize: 11,
                                       fontWeight: FontWeight.w400,
                                       textcolor: MyColors.whiteColor),
                                   TextWidget(
                                       input: cd.date,
                                       fontsize: 11,
                                       fontWeight: FontWeight.w400,
                                       textcolor: MyColors.orangeColor),
                                   TextWidget(
                                       input: cd.time,
                                       fontsize: 11,
                                       fontWeight: FontWeight.w600,
                                       textcolor: MyColors.orangeColor),
                                 ],
                               ),
                               IconButton(
                                 onPressed: (){

                                 },

                                 color:
                                 MyColors.whiteColor,
                                 iconSize: 23,
                                 icon: Icon(Icons.navigate_next),

                               ),
                             ],
                           ),

                         ],
                        ),
                      )


                    ),
                  ),

                );
              },
            ),*/