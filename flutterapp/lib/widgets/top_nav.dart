import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/responsive.dart';
import 'package:flutterapp/widgets/custom_text.dart';
AppBar topNavigatorBar(BuildContext context, GlobalKey<ScaffoldState> key) => 
  AppBar(
    leading: !ResponsiveWidget.isSmall(context) ?
    Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left:14),
          child: const Icon(Icons.science, color: Colors.grey),
        ),
      ],
    ) : IconButton(icon: const Icon(Icons.menu), color: Colors.grey, onPressed: (){
      key.currentState?.openDrawer();
    },),
    //applies to both small and big screen
    backgroundColor: Colors.white,
    title: Row(
      children: [
        const Visibility(child: CustomText(text: "timelife", color: Colors.grey, size: 20, weight: FontWeight.bold,)),
        //this container kind of fills in the space in the middle, interesting..
        Expanded(child: Container()),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings , color: Colors.black,)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications , color: Colors.black,)),
        const SizedBox(width: 5,),
        Container(width: 1, height: 22, color: Colors.grey,),
        const SizedBox(width: 5,),
        IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline , color: Colors.black,))
      ],
    ),
);