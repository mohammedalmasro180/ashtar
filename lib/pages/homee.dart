import 'package:animate_do/animate_do.dart';
import 'package:ashtar/pages/home_page.dart';
import 'package:ashtar/pages/proflio.dart';
import 'package:ashtar/widgets/Artists.dart';
import 'package:ashtar/widgets/app_bar.dart';
import 'package:ashtar/widgets/fotter.dart';
import 'package:ashtar/widgets/mostseen.dart';
import 'package:ashtar/widgets/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ashtar/widgets/grid.dart';
import 'package:flutter/material.dart';
class homemin extends StatefulWidget {
  @override
  _homeminState createState() => _homeminState();
}

class _homeminState extends State<homemin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [

                Container(
                  height:150,
                  width: 655,
                  child: slider(),
                ),
                Container(
                  child:  Column(
                    children: [
                      Container(
                        child:  Text("About Ishtar",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold,),),
                      ),
                      Container(
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Ishtar is the East Semitic Akkadian, Assyrian and Babylonian goddess of fertility, love, war, and sex. She is the counterpart to the Sumerian Inanna, and is the cognate for the Northwest Semitic Aramean goddess Astarte.",style: TextStyle(fontSize: 15,color: Colors.black,),),
                        ),
                      ),
                      Container(
                        child:  Text("Latest Paintings",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold,),),
                      ),
                      Container(

                        height:400,
                        child: FadeInUp(
                            duration: Duration(milliseconds: 65),
                            child: gridpaintings()),

                      ),
                      Container(
                        child:
                        InkWell(onTap: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => MyHomePage()));
                        },


                            child: Text("VIEW ALL",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,),)),

                      ),
                      Container(
                        child:  Text("Latest Active Artists",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold,),),

                      ),

                      Container(
                        height: 150,
                        width: 450,
                        child: Artists(),
                      ),
                      Container(
                        child:
                        InkWell(onTap: (){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => profilo()));
                        },
                            child: Text("VIEW ALL",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,),)),

                      ),
                      Container(
                        child:  Text("Most Seen Paintings",style: TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold,),),

                      ),
                      Container(
                        height: 450,
                        width: double.infinity,

                        color: Colors.blueGrey,
                        child: mostseen(),
                      ),
                      Container(
                        height:
                        200,
                        width: double.infinity,


                        child: fotter(),
                      ),


                    ],
                  ),
                ),


              ],

                           ),
          )
        ],
      )

    );

  }
}
