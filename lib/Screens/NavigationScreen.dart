
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gfitness/Screens/HomeScreen.dart';
import 'package:gfitness/Screens/InfoScreen.dart';
import 'package:gfitness/Screens/MoreScreen.dart';
import 'package:gfitness/Screens/PaymentScreen.dart';
import 'package:gfitness/widgets/TextWidget.dart';
import 'package:share_plus/share_plus.dart';


import '../MyColors.dart';

import 'AppointmentScreen.dart';



class NavigationScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomBarState()  ;
  }

}
class BottomBarState extends State<NavigationScreen> {

  int sum = 0;
  bool login=false;
  int _selectedIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    AppointmentScreen(),
    InfoScreen(),
    MoreScreen(),

  ];
  Widget _intInitialWidget = HomeScreen();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _intInitialWidget,
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 55.00,
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected:_onItemTapped,

        itemCornerRadius: 24,
        curve: Curves.easeIn,
        backgroundColor: MyColors.black,
          items:[
            BottomNavyBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/home.png",),
                 size: 22,
              ),
              title:TextWidget(input: "Home", fontsize:12, fontWeight: FontWeight.w700, textcolor:MyColors.orangeColor),


              activeColor: MyColors.orangeColor,
              inactiveColor: MyColors.gray

            ),
            BottomNavyBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/appt.png"),
                size: 22,
              ),
              title:TextWidget(input: "Trainer", fontsize:12, fontWeight: FontWeight.w700, textcolor:MyColors.orangeColor),
                activeColor: MyColors.orangeColor,
                inactiveColor: MyColors.gray
            ),
            BottomNavyBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/more.png",),
                size: 22,


              ),
              activeColor: MyColors.orangeColor,
              inactiveColor: MyColors.gray,
              title:TextWidget(input: "Info", fontsize:12, fontWeight: FontWeight.w700, textcolor:MyColors.orangeColor),


            ),
            BottomNavyBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/menuicon.png",),
                size: 22,


              ),
              activeColor: MyColors.orangeColor,
              inactiveColor: MyColors.gray,
              title:TextWidget(input: "More", fontsize:12, fontWeight: FontWeight.w700, textcolor:MyColors.orangeColor),


            ),
          ],



      ),
    );
  }
  void _onItemTapped(int index) {
    setState((){
      _selectedIndex = index;
      switch(index){
        case 0:
          _intInitialWidget = _children[0];
          break;
        case 1:
          _intInitialWidget = _children[1];

          break;

        case 2:
          _intInitialWidget = _children[2];

          break;
        case 3:
          _intInitialWidget = _children[3];

          break;



      }
    });
  }


}