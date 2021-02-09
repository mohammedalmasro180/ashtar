import 'package:flutter/material.dart';
Widget buttombar(context){
  return BottomNavigationBar(backgroundColor: Colors.blueGrey,
    items: [

      BottomNavigationBarItem(icon:

      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            height:30,
            width:double.infinity,

            child: Text("Terms of Service Privacy Policy",style: TextStyle(color: Colors.white),)

        ),
      ),
          // ignore: deprecated_member_use
          title:SizedBox.shrink()

      ),
      BottomNavigationBarItem(icon:

      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            height:30,
            width:double.infinity,

            child: Text("Implemented by Yes Soft",style: TextStyle(color: Colors.white),)

        ),
      ),

          // ignore: deprecated_member_use
          title:SizedBox.shrink()

      ),








      BottomNavigationBarItem(icon: Container(
          height:30,
          width:30,

          child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/1200px-WhatsApp.svg.png",width: 550,height: 550,)

      ),
          // ignore: deprecated_member_use
          title:SizedBox.shrink()

      ),
    ],
  );
}