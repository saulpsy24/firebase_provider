import 'package:firebase_login_messages/pages/home/hometab.dart';
import 'package:firebase_login_messages/pages/loginpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_login_messages/pages/profile/profiletab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../providers/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  

  @override
  Widget build(BuildContext context) {
    var loginstate = Provider.of<MyProvider>(context);
    final page = LoginPage();
    void usuario() async {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
    }

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.subject, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          loginstate.updateIndex = index;
          //Handle button tap
        },
      ),
      body: 
         Container(
          color: Colors.blue,
          child:_selectPage(loginstate.selectedIndex)
              ,
        
      ),
    );
  }

  _selectPage (int indice) {
    switch(indice){
      case 0:
      return HomeTab();
      case 1:
      return Container(color:Colors.blue , child: Center(child: Text('Cursos'),),);
      case 2:
      return ProfileTab();
      default:
      return Container(color:Colors.blue , child: Center(child: Text('Not valid'),),);
    }
  }

 

 
}
