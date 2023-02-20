import 'package:flutter/material.dart';
import 'package:gfitness/Models/CategoryModel.dart';
import 'package:gfitness/Models/WorkoutModel.dart';
import 'package:gfitness/MyColors.dart';
import 'package:gfitness/Screens/WorkOutDetails.dart';
import 'package:gfitness/widgets/Toolbar.dart';

class WorkOutScreen extends StatefulWidget{
  const WorkOutScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WorkState();
  }

}
class WorkState extends State<WorkOutScreen>{
  List<WorkoutModel> WorkList=[
   WorkoutModel("1", "assets/images/bfs3.jpg", "assets/images/bfs2.jpg", "assets/images/bfs.jpg", "Want your body to be healthy. Join our program with directions according to body’s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ",),
   WorkoutModel("1", "assets/images/catbiceps.png", "assets/images/bwd.png", "assets/images/wdo.png", "Want your body to be healthy. Join our program with directions according to body’s goals. Increasing physical strength is the goal of strenght training. Maintain body fitness by doing physical exercise at least 2-3 times a week. ",),

  ];
  late CategoryModel categoryModel;
  late String categoryName,categoryId;
  bool isListPressed = true;
  @override
  Widget build(BuildContext context) {
    categoryModel = ModalRoute.of(context)!.settings.arguments as CategoryModel;
    categoryName=categoryModel.name;
    categoryId=categoryModel.id;
    // TODO: implement build
   return Scaffold(
     appBar:ToolbarBack(appBar: AppBar(), title: categoryName.toString()),
     body: SafeArea(

       child: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         color: MyColors.black,

         child: CustomScrollView(
           slivers: [
             SliverGrid(
                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                     maxCrossAxisExtent: 380.0,



                     childAspectRatio: 1.7),
                 delegate: SliverChildBuilderDelegate(

                       (BuildContext context, int index) {
                     late WorkoutModel pm = WorkList[index];
                     return GestureDetector(
                         onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => WorkOutDetails(),
                               settings: RouteSettings(
                                 arguments: pm,
                               ),
                             ),
                           );
                         },
                         child: Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: Card(
                             color: MyColors.nocolor,
                             elevation: 20,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(4.0),
                                 side: BorderSide(
                                     color: MyColors.whiteColor,
                                     width: 4.0)),
                             child: Stack(


                               children: <Widget>[
                                 Image.asset(pm.image3,
                                   color: MyColors.gray
                                       .withOpacity(0.2),
                                   colorBlendMode: BlendMode.hue,
                                     width: MediaQuery.of(context).size.width,
                                   height: MediaQuery.of(context).size.height)




                               ],
                             ),
                           ),
                         )

                       //ProductGridItem(model: pm),
                     );
                   },
                   childCount: WorkList.length,
                 ))

           ],
         ),

       ),
     ),

   );
  }

}