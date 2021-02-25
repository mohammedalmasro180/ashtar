

import 'package:flutter/cupertino.dart';
import 'package:passwordfield/passwordfield.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ashtar/pages/proflio.dart';
import 'package:flutter/material.dart';

import 'package:ashtar/pages/cart_page.dart';
import 'package:ashtar/pages/menu_page.dart';
import 'package:ashtar/theme/colors.dart';
TextEditingController username = new TextEditingController();
TextEditingController userlog = new TextEditingController();
TextEditingController  email= new TextEditingController();
TextEditingController  password= new TextEditingController();
TextEditingController  passwordlog= new TextEditingController();
TextEditingController confirmpassword= new TextEditingController();


Widget getAppBar(context){
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  return AppBar(title:  Image.network("http://dev-ishtar.96.lt/assets/logo.png",width: 200,height: 200,),
    backgroundColor: Colors.white ,
      leading:  InkWell
        (onTap: (){
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

                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(padding: const EdgeInsets.all(10.0), 
                                        child:   Image.network("http://dev-ishtar.96.lt/assets/logo.png",width: 200,height: 200,),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(onTap: (){},
                                          child: Text("Home",style: TextStyle(fontSize:15,color: Colors.black),),),
                                      )
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(onTap: (){},
                                          child: Text("Artists",style: TextStyle(fontSize:15,color: Colors.black),),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(onTap: (){},
                                          child: Text("Paintings",style: TextStyle(fontSize:15,color: Colors.black),),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(onTap: (){},
                                          child: Text("About us",style: TextStyle(fontSize:15,color: Colors.black),),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(onTap: (){},
                                          child: Text("FAQ",style: TextStyle(fontSize:15,color: Colors.black),),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(onTap: (){},
                                          child: Text("Imprint",style: TextStyle(fontSize:15,color: Colors.black),),),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: InkWell(onTap: (){},
                                          child: Text("Data Processing",style: TextStyle(fontSize:15,color: Colors.black),),),
                                      )
                                    ],
                                  ),







                                ],
                              ),
                            )
                          ),


                        ],

                      ),
                    )

                ),
              );
            }
        );
  },
       child:Icon(Icons.list,color: Colors.black,) ,),



      actions:[


        Padding(padding: EdgeInsets.all(10),
        child: InkWell
          (onTap: (){

        },
          child: Text("Login",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.w900,fontSize: 20),),),
        )
        ]

    );

  }
Future<List> singup() async {
  print(username.text);
  print(email.text);
  print(password.text);var headers = {
    'Authorization': 'Bearer Basic CUJDNzc5UUFTTE42RTVCU1ZVN1JYOTYyVVc2VTZRRjZD',
    'Content-Type': 'text/plain'
  };
  var request = http.Request('POST', Uri.parse('http://dev-ishtar.96.lt/ishtar-backend/public/register'));
  request.body = '''{\r\n"username":"${username.text}",\r\n"password":"${password.text}",\r\n"email":"${email.text}",\r\n"image":"pp0ppppp"\r\n}''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.statusCode);
  }

}
Future<void> _showMyDialog() async {
  return showDialog<void>(
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }, context: null,
  );
}
Future<void> login() async {var headers = {
  'Authorization': 'Bearer Basic CUJDNzc5UUFTTE42RTVCU1ZVN1JYOTYyVVc2VTZRRjZD',
  'Content-Type': 'application/json'
};
var request = http.Request('POST', Uri.parse('http://dev-ishtar.96.lt/ishtar-backend/public/login_check?username=jjjj@gmail.com&password=12345'));
request.body = '''{\r\n "username":"${userlog.text}",\r\n "password":"${passwordlog.text}"   \r\n}''';
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.statusCode);
}


}
