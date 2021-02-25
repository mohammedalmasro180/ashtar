

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
                                    controller: userlog,
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
                                  PasswordField(
                                    controller: passwordlog,
                                    color: Colors.white,
                                    hasFloatingPlaceholder: true,
                                    pattern: r'.*[@$#.*].*',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(width: 2, color: Colors.grey.shade300)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 2, color: Colors.grey.shade300)),
                                    errorMessage: 'must contain special character either . * @ # \$',
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
                                        onPressed: () {
                                          login();
                                          showDialog(context: context,
                                              builder: (BuildContext context) {
                                                return Center(
                                                  child: Container(
                                                      color: Colors.white,
                                                      width: 250,
                                                      height: 250,
                                                      child: Center(child: Text("Login Successfully",style: TextStyle(fontSize:15,color: Colors.black),))),

                                                );
                                              }

                                          );

                                        },
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
                                    controller: username,
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
                                  TextField(
                                    controller: email,
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


                                      labelText: "Name",
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
                                  PasswordField(
                                    controller: password,
                                    color: Colors.white,
                                    hasFloatingPlaceholder: true,
                                    pattern: r'.*[@$#.*].*',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        borderSide: BorderSide(width: 2, color: Colors.grey.shade300)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 2, color: Colors.grey.shade300)),
                                    errorMessage: 'must contain special character either . * @ # \$',
                                  ),

                                  SizedBox(height: 16,),






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
                                        onPressed: () {
                                          singup();
                                          showDialog(context: context,
                                              builder: (BuildContext context) {
                                                return Center(
                                                  child: Container(
                                                      color: Colors.white,
                                                      width: 250,
                                                      height: 250,
                                                      child: Center(child: Text("Signup Successfully",style: TextStyle(fontSize:15,color: Colors.black),))),

                                                );
                                              }

                                          );

                                        },
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
