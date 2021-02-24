import 'package:flutter/material.dart';
class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(accountName: Text("Mohammed Almasri")
            , accountEmail: Text("mohammedalmasri@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person,color: Colors.white,),
              ),
            ),
            decoration: new BoxDecoration(
                color: Colors.white
            ),
          ),
          InkWell(onTap: (){},
            child:
            ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home),
            ),
          ),




        ],
      ),
    );
  }
}
