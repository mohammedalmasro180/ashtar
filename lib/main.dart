import 'package:animate_do/animate_do.dart';
import 'package:ashtar/pages/home_page.dart';
import 'package:ashtar/pages/product_detail_page.dart';
import 'package:ashtar/theme/colors.dart';
import 'package:ashtar/widgets/app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ishtar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}
