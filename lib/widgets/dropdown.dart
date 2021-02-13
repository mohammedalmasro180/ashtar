import 'dart:convert';

import 'package:ashtar/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class dropdown extends StatefulWidget {
  @override
  _dropdownState createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {


  Map filtermap;
  int i=1;



  List filterlist = [];
  List
  img = [];

  bool isLoading = false;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchfilterlist();
  }
  fetchfilterlist() async {
    setState(() {
      isLoading = true;
    });
    var url = "http://dev-ishtar.96.lt/ishtar-backend/public/paintings";

    var response = await http.get(url);
    // print(response.body);
    if (response.statusCode == 200) {
      filtermap = json.decode(response.body);


      //var data = filtermap['Data'][2]['artist'];


      //print(filterlists);
      setState(() {
        while(i!=0) {
          i++;
          filtermap.forEach((k, v) =>
              filterlist.add(filtermap['Data'][i]['name'].toString()));
        }
        while(i!=0) {
          i++;

          filtermap.forEach((k, v) =>
              img.add(filtermap['Data'][i]['path'].toString()));
        }

        //   filterlists = data;
        isLoading = false;

      });

    } else {
      filterlist = [];
      isLoading = false;
    }
  }  @override
  Widget build(BuildContext context) {


    Item selectedfilterlist;
    List<Item> filterlists = <Item>[
      for(int c=1;c<5;c++)
        Item(filterlist[c].toString()),

    ];
    return Row(
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<Item>(
            hint:  Text("Select item"),
            value: selectedfilterlist,
            onChanged: (Item Value) {
              setState(() {
                selectedfilterlist = Value;
                print(selectedfilterlist.name.toString());
              });
            },
            items: filterlists.map((Item filterlist) {
              return  DropdownMenuItem<Item>(
                value: filterlist,
                child: Row(
                  children: <Widget>[

                    SizedBox(width: 10,),
                    Text(
                      filterlist.name,
                      style:  TextStyle(color: Colors.black),
                    ),

                  ],
                ),
              );
            }).toList(),
          ),
        ),

      ],
    );

  }
}

class Item {
 const Item(this.name);
  final String name;
}