import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin
{
  TabController controller;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool loading;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>
    ();

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    loading = false;
    _email = new TextEditingController(text: "rajeshvishnani");
    _password = new TextEditingController(text: "Rajesh@MaaKiRasoi");
  }

  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
    controller.dispose();
    setState(() {
      loading = false;
    });
    _email.dispose();
    _password.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  Future _writer(String username, String password, String token) async {
  }

  static final String authTokenKeys = 'auth_token';
  static final String nameKeys = 'username';
  static final String passwordKeys = 'password';

  _login(username, password) async {
    setState(() {
      loading = true;
    });

    var body = json.encode({
      "username":"hammam",
      "password":"12345",
      "email":"kkjkkkj@gmail.com",
      "image":"jjjjj"
    });

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    await http
        .post("http://dev-ishtar.96.lt/ishtar-backend/public/register",
        body: body, headers: headers)
        .then((response) {
      var body = json.decode(response.body);

      if (response.statusCode == 200) {
        // TODO: you need to store body['token'] to use in some authentication
        loading = false;
        _writer(_email.text, _password.text, body['token']);

      } else {
        // TODO: alert message
        final snackBar = SnackBar(
          content: Text(body['message']),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/art.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white12.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 55.0,
                backgroundImage: AssetImage('images/logo.png'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 300,
                  child: new Center(
                    child: new Container(
                      height: 10.0,
                      color: Colors.black12,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    Chip(
                      label: Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      backgroundColor: Color(0xFFD1A155),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 35,
                      child: Container(
                        width: MediaQuery.of(context).size.height / 12,
                        height: 2.0,
                        color: Colors.white,
                      ),
                    ),
                    Chip(
                      label: Text(
                        "SIGN UP",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      backgroundColor: Colors.black87,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "Welcome back!",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFD1A155),
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: Column(
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                      hintColor: Colors.black26,
                      primaryColor: Color(0xFFD1A155),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        //validator: _email.text.isEmpty?:null,
                        controller: _email,

                        decoration: InputDecoration(
                            border:
                            OutlineInputBorder(borderSide: BorderSide()),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xFFD1A155),
                            ),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 45,
                  ),
                  Theme(
                    data: ThemeData(
                        primaryColor: Color(0xFFD1A155),
                        hintColor: Colors.black26),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: _password,
                        decoration: InputDecoration(
                            border:
                            OutlineInputBorder(borderSide: BorderSide()),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xFFD1A155),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ActionChip(
                              onPressed: () {},
                              avatar: Checkbox(
                                value: false,
                                onChanged: (bool z) {
                                  print(z);
                                },
                                activeColor: Color(0xFFD1A155),
                              ),
                              label: Text("Remember Me"),
                              backgroundColor: Colors.transparent,
                            ),
                          ],
                        ),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFFD1A155),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: InkWell(
                      onTap: () {
                        _login(_email.text, _password.text);
                        //                        Navigator.push(
                        //                            context,
                        //                            MaterialPageRoute(
                        //                                builder: (context) => HomePage()));
                      },
                      child: loading
                          ? CircularProgressIndicator()
                          : Container(
                        height: MediaQuery.of(context).size.height / 13,
                        //width: MediaQuery.of(context).size.height / 1.8,
                        decoration: BoxDecoration(
                          color: Color(0xFFD1A155),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  height: 2.0,
                  child: new Center(
                    child: new Container(
                      height: 10.0,
                      color: Colors.black12,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 18,
                  width: MediaQuery.of(context).size.height / 11,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black12)),
                  child: Center(
                      child: Text(
                        "OR",
                        style: TextStyle(fontSize: 18.0),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 18.0,
                        ),
                        Icon(Icons.tag_faces),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Facebook",
                          style: TextStyle(fontSize: 22.0, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 13,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black12)),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 18.0,
                        ),
                        Icon(Icons.tag_faces),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Google+",
                          style: TextStyle(fontSize: 22.0, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                child: RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(fontSize: 20.0, color: Colors.black87),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign up',
                              style: TextStyle(
                                  color: Color(0xFFD1A155),
                                  fontWeight: FontWeight.bold)),
                        ])),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
          ],
        ),
      ),
    );
  }
}
