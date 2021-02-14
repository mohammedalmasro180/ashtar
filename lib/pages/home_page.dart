import 'package:animate_do/animate_do.dart';
import 'package:ashtar/widgets/buttombar.dart';
import 'package:ashtar/widgets/dropdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:ashtar/constant/product_data.dart';
import 'package:ashtar/pages/cart_page.dart';
import 'package:ashtar/pages/product_detail_page.dart';

import 'package:ashtar/theme/colors.dart';
import 'package:ashtar/widgets/app_bar.dart';
import 'package:line_icons/line_icons.dart';
final List users = [];
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = new TextEditingController();
  TextEditingController  artist= new TextEditingController();
  String filter = '';
  String filterartist = '';
  var namee;

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



      print(data);
      setState(() {
        data = map['Data'];

        users = data;
        print(users);
        //users = data;
        namee = users[i]['name'];
        isLoading = false;
        controller.addListener(() {
          setState(() {
            filter = controller.text;
            filterartist=artist.text;
          });
        });
      });
    }
    else {
      users = [];
      isLoading = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Column(

        children: <Widget>[
          Column(

            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: 35,
                        left: 15,
                        right: 5,
                        bottom: 5,
                      ),
                      color: Color.fromRGBO(221, 221, 221, 1),
                      child: TextField(
                        controller: controller,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Artistic painting',
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(25.7),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.7),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    color: Color.fromRGBO(221, 221, 221, 1),
                    padding: EdgeInsets.only(
                      top: 25,
                      right: 15,
                    ),
                    child: Icon(Icons.search),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: 35,
                        left: 15,
                        right: 5,
                        bottom: 5,
                      ),
                      color: Color.fromRGBO(221, 221, 221, 1),
                      child: TextField(
                        controller: artist,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'by artist',
                          filled: true,
                          fillColor:
                          Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(25.7),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.7),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    color: Color.fromRGBO(221, 221, 221, 1),
                    padding: EdgeInsets.only(
                      top: 25,
                      right: 15,
                    ),
                    child: Icon(Icons.search),
                  )
                ],
              ),

            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ListView.builder(

              itemCount:users.length,
              itemBuilder: (ctx, index) {
                var img=users[index]['image'];
                var text=users[index]['name'];
                var id=users[index]['id'];
                var price=users[index]['price'];
                var artist=users[index]['artist'];

                return text.toLowerCase().contains(filter.toLowerCase())
                && artist.toLowerCase().contains(filterartist.toLowerCase())
                    ? FadeInDown(
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
                ): SizedBox.shrink();
              },
            ),
          )
        ],
      ),
    );
  }
}