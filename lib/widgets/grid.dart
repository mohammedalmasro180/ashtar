import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:ashtar/pages/product_detail_page.dart';
import 'package:ashtar/theme/colors.dart';
import 'package:flutter/cupertino.dart';
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
    return ListView.builder(

      itemCount:users.length,
      itemBuilder: (ctx, index) {
        var img=users[index]['image'];
        var text=users[index]['name'];
        var id=users[index]['id'];
        var price=users[index]['price'];
        var artist=users[index]['artist'];

        return FadeInDown(
          duration: Duration(milliseconds: 350 * index),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
                  id: id,

                )));
              },
              child: Container(
                  child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [BoxShadow(
                                  spreadRadius: 1,
                                  color: black.withOpacity(0.1),
                                  blurRadius: 2
                              )]
                          ),

                          child: Stack(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Image.network(
                                  img.toString(),
                                  height: 300,
                                  width: 500,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 220,left: 44),


                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Container(

                                    color: Colors.black45,
                                    width: 500,
                                    child: Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                                      children: [
                                        Column(
                                          children: [
                                            Padding(

                                                padding:EdgeInsets.all(5),
                                                child: Text(
                                                  text.toString(),
                                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0,backgroundColor: Colors.black12),
                                                )),
                                            Padding(

                                                padding:EdgeInsets.all(5),
                                                child: Text(
                                                  price.toString()+"\$",
                                                  style: TextStyle(color: Colors.white,  fontSize: 18.0,backgroundColor: Colors.black12),
                                                )),
                                          ],
                                        ),

                                        Column(
                                          children: [

                                            Row(
                                              children: [
                                                Padding(

                                                    padding:EdgeInsets.all(5),
                                                    child: Text(
                                                      "20",
                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0,backgroundColor: Colors.black12),
                                                    )),
                                                Padding(

                                                    padding:EdgeInsets.all(5),
                                                    child: Icon(Icons.favorite,color: Colors.white,)
                                                ),
                                                Padding(

                                                    padding:EdgeInsets.all(5),
                                                    child: Text(
                                                      "20",
                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0,backgroundColor: Colors.black12),
                                                    )),
                                                Padding(

                                                    padding:EdgeInsets.all(5),
                                                    child: Image.network("https://img.icons8.com/android/25/ffffff/visible.png")
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),

                        ),
                      ]                      )
              ),
            ),
          ),
        );
      },
    );
  }
}