import 'package:ashtar/pages/proflio.dart';
import 'package:flutter/material.dart';

import 'package:ashtar/pages/cart_page.dart';
import 'package:ashtar/pages/menu_page.dart';
import 'package:ashtar/theme/colors.dart';

Widget getAppBar(context){
    return AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon:Icon(Icons.ac_unit),onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => MenuPage()));
        }),
            InkWell(onTap: (){},
              child: Text("data",style: TextStyle(fontSize: 22),),),
            Row(
              children: <Widget>[

          IconButton(icon: Container(
            width:100 ,
            child: Center(
              child: Text("Astries",style: TextStyle(

                color: white,
                fontSize: 13,
                fontWeight: FontWeight.w600
              ),),
            ),
            decoration: BoxDecoration(
              color: black,
              shape: BoxShape.rectangle
            ),
          ), onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => profilo()));
          }),
              ],
            )
          ],
        ),
      );
  }