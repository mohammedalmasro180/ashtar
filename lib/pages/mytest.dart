import 'package:ashtar/constant/myctrl.dart';
import 'package:flutter/material.dart';
class mytest extends StatefulWidget {
  @override
  _mytestState createState() => _mytestState();
}

class _mytestState extends State<mytest> {
  List deta;
  myctrl ctrl=new myctrl();

  @override

  Widget build(BuildContext context) {
    deta =ctrl.data;
    ctrl.gitdata();
    return Scaffold(
      body: ListView.builder(
          itemCount: deta.length,
          itemBuilder: (context,index)
      {
        return Text(deta[index].toString());

      }),
    );
  }
}
