import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:ashtar/constant/myctrl.dart';
import 'package:ashtar/pages/profile.dart';
import 'package:ashtar/widgets/app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:ashtar/theme/colors.dart';
import 'package:ashtar/widgets/product_slider.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;





  const ProductDetailPage({Key key, this.id}) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map map;
  int i = 1;
  var price;
  Map mapp;
  var width;
  var hiegth;
  var story;
  var artist;
  var artistname;
  var imtg;
  var artistid;
  var name;
  var img;
  myctrl ctrl;
  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }


  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/painting/${widget.id}";
    var response = await http.get(url);
    // print(response.body);
    map = json.decode(response.body);
    artistid=  map["Data"]["artistID"];
    var urll  = "http://dev-ishtar.96.lt/ishtar-backend/public/artist/${artistid}";
    var resonse = await http.get(urll);
    mapp = json.decode(resonse.body);
    imtg=mapp['Data']['path'];
    artistname=mapp['Data']['name'];


    //List<dynamic> data = ;
    print(map["Data"]["price"]);
    setState(() {
      name= map["Data"]["name"];
      price= map["Data"]["price"];
      img= map["Data"]["image"];



      artist= map["Data"]["artist"];
      hiegth= map["Data"]["height"];
      width= map["Data"]["height"];
      story= map["Data"]["story"];
      isLoading = false;
    });




  }

    @override
    Widget build(BuildContext context) {


      //String url=users[2]['image'];


      return Scaffold(
        appBar: getAppBar(context),
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              SizedBox(height: 30,),
              FadeInDown(
                delay: Duration(
                    milliseconds: 350
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Center(

                    child: Container(
                      width: 280,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(img.toString()),fit: BoxFit.cover)
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),

              FadeInDown(
                delay: Duration(
                    milliseconds: 350
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Text(name.toString(),
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        height: 1.5
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: FadeInDown(
                  delay: Duration(
                      milliseconds: 400
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text("\$"+price.toString(), style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        height: 1.5
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(height: 25,),
              FadeInDown(
                delay: Duration(
                    milliseconds: 400
                ),
              ),
              SizedBox(height: 25,),
              Container(
                alignment: FractionalOffset.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Padding(padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Icon((Icons.favorite)),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Icon((Icons.shopping_cart)),
                    ),

                  ],

                ),
              ),
              Row(
                children: [

                  Padding(padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(imtg.toString()),fit: BoxFit.cover,  ),

                        borderRadius: BorderRadius.circular(80.0),
                        border: Border.all(
                          color: Colors.white,
                          width: 10.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0),
                  child: Text(artistname.toString(),style: TextStyle(color: Colors.lime,fontSize: 25),),),
                  Padding(padding: EdgeInsets.all(8),
                  child: InkWell(onTap: (){},
                  child: Container(
                    width: 100,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                            spreadRadius: 1,
                            color: Colors.amber,
                            blurRadius: 2
                        )]
                    ),
                    child: Center(child: Text("FOLLOW",style: TextStyle(color: Colors.black,fontSize: 15),)),

                  ),),)
                ],
              ),
              Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text("Height",

                        style: TextStyle(
                            fontSize: 20,

                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text(hiegth.toString(),

                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text("Width ",

                        style: TextStyle(
                            fontSize: 20,

                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text(width.toString(),

                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5
                        ),
                      ),
                    ),

                  ]
              ),
              Divider(height: 60, color: Colors.black,),
              Row(
                  children: <Widget>[


                    Padding(padding: const EdgeInsets.all(10),
                      child: Text("Story",

                        style: TextStyle(
                            fontSize: 20,

                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: Text(story.toString(),

                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5
                        ),
                      ),
                    ),

                  ]
              ),


              Divider(height: 60, color: Colors.black,),
              Row(
                  children: <Widget>[


                    Padding(padding: const EdgeInsets.all(10),
                      child: Text("Artist",

                        style: TextStyle(
                            fontSize: 20,

                            height: 1.5
                        ),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(10),
                      child: InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>
                            UserProfilePage(
                              id: artistid,

                            )));

                      },
                      child: Text(artist.toString(),

                        style: TextStyle(
                            color: Colors.lime,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5
                        ),
                      ),)
                    ),

                  ]
              ),


              SizedBox(height: 50,),

              SizedBox(height: 70,),
            ],
          ),
        ),
      );
    }
  }