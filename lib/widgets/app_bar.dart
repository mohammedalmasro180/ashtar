

import 'package:ashtar/pages/proflio.dart';
import 'package:flutter/material.dart';

import 'package:ashtar/pages/cart_page.dart';
import 'package:ashtar/pages/menu_page.dart';
import 'package:ashtar/theme/colors.dart';

Widget getAppBar(context){
    return AppBar(title:  Image.network("http://dev-ishtar.96.lt/assets/logo.png",width: 200,height: 200,),
    backgroundColor: Colors.amber,

      actions:[

        Padding(padding: EdgeInsets.all(10),
        child: InkWell(onTap: (){
          showDialog(context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Center(
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      Container(
                        width: 450,
                        color: Colors.limeAccent[300],

                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.all(10),
                              child:   Image.network("http://dev-ishtar.96.lt/assets/logo.png",width: 200,height: 200,),
                            ),
                            Padding(padding: EdgeInsets.all(10),
                                child: Text("Welcome in Ishtar",style: TextStyle(fontSize: 30),)
                            ),
                            Divider(height: 20,),
                            Padding(padding: EdgeInsets.all(10),
                                child: Text("To login please fill the boxes below:",style: TextStyle(fontSize: 10),)
                            ),

                            TextField(
                              //controller: ussename,
                              decoration: InputDecoration(

                                labelText: "Email ",
                                labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 16,),
                            TextField(

                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 12,),
                            Container(
                              height: 100,
                              width: double.infinity,
                              child:       Container(
                                margin: EdgeInsets.all(20),
                                child: FlatButton(
                                  child: Text('Login'),
                                  color: Colors.amberAccent,
                                  textColor: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Image.network("http://ishtar-art.de/assets/slider-images/7.png",width: 200,height: 200,),

                              ],
                            )





                          ],
                        ),
                      ),
                      Container(
                        width: 450,
                        color: Colors.limeAccent[300],

                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.all(10),
                              child:   Image.network("http://dev-ishtar.96.lt/assets/logo.png",width: 200,height: 200,),
                            ),
                            Padding(padding: EdgeInsets.all(10),
                                child: Text("Welcome in Ishtar",style: TextStyle(fontSize: 30),)
                            ),
                            Divider(height: 20,),
                            Padding(padding: EdgeInsets.all(10),
                                child: Text("To signup please fill the boxes below:",style: TextStyle(fontSize: 10),)
                            ),

                            TextField(
                              //controller: ussename,
                              decoration: InputDecoration(

                                labelText: "Username ",
                                labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 16,),
                            TextField(
                              //controller: ussename,
                              decoration: InputDecoration(

                                labelText: "Email ",
                                labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 16,),


                            TextField(

                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 12,),
                            TextField(

                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    )
                                ),
                              ),
                            ),
                            SizedBox(height: 12,),
                            Container(
                              height: 100,
                              width: double.infinity,
                              child:       Container(
                                margin: EdgeInsets.all(20),
                                child: FlatButton(
                                  child: Text('Signup'),
                                  color: Colors.amberAccent,
                                  textColor: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                            ),





                          ],
                        ),
                      ),

                    ],

                  ),
                )

                              ),
            );
          }
          );
        },
          child: Text("Atrits",style: TextStyle(fontSize: 20,color: Colors.black),),),)
        ]

    );
  }