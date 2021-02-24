import 'package:ashtar/pages/home_page.dart';
import 'package:ashtar/pages/homee.dart';
import 'package:ashtar/pages/proflio.dart';
import 'package:flutter/material.dart';
class fotter extends StatefulWidget {
  @override
  _fotterState createState() => _fotterState();
}

class _fotterState extends State<fotter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Image.network("http://dev-ishtar.96.lt/assets/logo.png",width: 200,height: 200,),
          ],
        ),

        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 55,left: 55),
              child: Column(
                children: [
                  InkWell(onTap: (){
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => homemin()));
                  },
                      child: Text("Home",style: TextStyle(fontSize: 15,color: Colors.black,),)),
                  InkWell(onTap: (){
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => profilo()));
                  },
                      child: Text("Artists",style: TextStyle(fontSize: 15,color: Colors.black,),)),
                  InkWell(onTap: (){
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                      child: Text("Paintings",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold,),)),


                ],
              ),
            ),
          ],
        ),


      ],
    );
  }
}
