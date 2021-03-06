
import 'dart:convert';

import 'package:ashtar/pages/profile.dart';
import 'package:ashtar/theme/colors.dart';
import 'package:http/http.dart' as http;
import 'package:ashtar/widgets/app_bar.dart';
import 'package:flutter/material.dart';
class profilo extends StatefulWidget {
  @override
  _profiloState createState() => _profiloState();
}

class _profiloState extends State<profilo> {
  Map map;
  int i;
  List adres;
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
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/artists";
    var response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      map = json.decode(response.body);
      //map = json.decode(response.body);


      var data=map['Data'];
      setState(() {
        users = data;
        isLoading = false;
      });
    }else{
      users = [];
      isLoading = false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Center(
          child:   GridView.builder(
              gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),


              itemCount: users.length,
              //scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                var text = users[index]['name'];
                var img = users[index]['path'];
                var id = users[index]['id'];
                var painting = users[index]['painting'];


                return Padding(padding: EdgeInsets.all(10), child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) =>
                      UserProfilePage(
                        id: id,

                      )));
                },

                  child: Container(
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                            spreadRadius: 2,
                            color: Colors.limeAccent,
                            blurRadius: 2
                        )
                        ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(40),
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,

                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(
                                        img

                                    )
                                )
                            ),

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15),

                          child: Text(text.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15,left: 15),
                          child: Text("Painting/s   "+painting.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                        ),

                      ],
                    ),
                  ),
                ),

                );
              }      )
      ),

    );

  }
}
