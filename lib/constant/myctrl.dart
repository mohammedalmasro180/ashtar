import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class myctrl{
  String string;
  List data;
  Future<List> gitdata () async {
    Map map;

    int i = 1;

    List users = [];
    var data;
    bool isLoading = false;
    @override
      var url = "http://dev-ishtar.96.lt/ishtar-backend/public/paintings";
      var response = await http.get(url);
      // print(response.body);
      if (response.statusCode == 200) {
        map = json.decode(response.body);


        print(data);

        data = map['Data'];
      }

      return data;
    }
    Future<String> gitimg(dynamic id) async {

    Map map;
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/artist/${id}";
    var response = await http.get(url);
    // print(response.body);
    map = json.decode(response.body);
    //List<dynamic> data = ;
   string= map["Data"]["path"];

    return string;

    }
  }
