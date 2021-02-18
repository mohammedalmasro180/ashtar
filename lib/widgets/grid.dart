import 'dart:convert';

import 'package:ashtar/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class gridpaintings extends StatefulWidget {
  @override
  _gridpaintingsState createState() => _gridpaintingsState();
}

class _gridpaintingsState extends State<gridpaintings> {
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
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: users.length,
        //scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          var img=users[index]['image'];
          var id=users[index]['id'];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
                id: id,

              )));
            },
            child: Container(

              alignment: Alignment.center,
              child: Image.network(

                img.toString(),
                height: 170,
                width: 170,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
    );
  }
}