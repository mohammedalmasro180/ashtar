import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class mostseen extends StatefulWidget {
  @override
  _mostseenState createState() => _mostseenState();
}

class _mostseenState extends State<mostseen> {

  Map map;
  List filterlist = [];
  int i=1;

  List users = [];
  var data;
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
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/paintings";
    var response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      map = json.decode(response.body);
    }
    var Data=map['Data'];


    print(data);
    setState(() {
      users=Data;


    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

        itemCount: users.length,
        //scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          var img=users[index]['image'];
          var text=users[index]['name'];
          var id=users[index]['id'];
          var price=users[index]['price'];
          var artist=users[index]['artist'];
         var hiegth= users[index]["height"];

       var   width= users[index]["height"];

          var story=users[index]['story'];

          return Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                Container(

                  color: Colors.white,
                  width: 400,
                  height:295,
                  alignment: Alignment.topCenter,
                  child: Column(

                    children: [
                      Image.network(
                        img.toString(),
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      Column(
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.all(0),
                              child: Text(text.toString(),

                                style: TextStyle(
                                    color: Colors.lime,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(padding: const EdgeInsets.all(1),
                                  child: Text("Artist Name :",

                                    style: TextStyle(
                                        fontSize: 15,

                                        height: 1.5
                                    ),
                                  ),
                                ),
                                Padding(padding: const EdgeInsets.all(0),
                                  child: Text(artist.toString(),

                                    style: TextStyle(
                                        fontSize: 15,

                                        height: 1.5
                                    ),
                                  ),
                                ),  ],
                            ),
                            Divider(height: 60, color: Colors.black,),
                            Row(
                              children: [
                                Padding(padding: const EdgeInsets.all(1),
                                  child: Text("Artist Name :",

                                    style: TextStyle(
                                        fontSize: 15,

                                        height: 1.5
                                    ),
                                  ),
                                ),
                                Padding(padding: const EdgeInsets.all(0),
                                  child: Text(artist.toString(),

                                    style: TextStyle(
                                        fontSize: 15,

                                        height: 1.5
                                    ),
                                  ),
                                ),  ],
                            ),


                          ]
                      ),





                    ],
                  ),
                ),


              ],
            ),
          );
        }
    );
  }
}
