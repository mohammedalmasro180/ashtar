import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
class Artists extends StatefulWidget {
  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
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


      var data = map['Data'];
      setState(() {
        users = data;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }
    @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: users.length,
        //scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          var img=users[index]['path'];
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
          );
        }
    );
  }
}
