import 'package:animate_do/animate_do.dart';
import 'package:ashtar/widgets/buttombar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:ashtar/constant/product_data.dart';
import 'package:ashtar/pages/cart_page.dart';
import 'package:ashtar/pages/product_detail_page.dart';

import 'package:ashtar/theme/colors.dart';
import 'package:ashtar/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map map;
  int i=1;

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
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/paintings";
    var response = await http.get(url);
    // print(response.body);
    if(response.statusCode == 200){
      map = json.decode(response.body);


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: getAppBar(context),
      bottomNavigationBar: buttombar(context),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(top: 40,left: 30,right: 30,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("",style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                ),),

              ],
            ),
          ),
          Column(children: List.generate(users.length, (index){
            var text=users[index]['name'];
            var img=users[index]['image'];
            var id=users[index]['id'];
            var price=users[index]['price'];

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
                                                    child: Icon(Icons.ac_unit,color: Colors.white,)
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),

                                      ],
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
          })
          )
        ],
      ),
    );
  }

}