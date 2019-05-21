import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_messages/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser();

    return Container(
      color: Colors.blue,
      child: SafeArea(
          child: Container(
        child: Center(
            child: Container(
          height: MediaQuery.of(context).size.height * .6,
          width: MediaQuery.of(context).size.width * .85,
          child: Card(
              child: Column(
            children: <Widget>[
              Text('Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .05),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/boy.png'))),
              ),
              Text('Saúl Ramírez Islas',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
                      Text('saul.ramirez@disolutionsmx.com',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 19,
                      fontWeight: FontWeight.bold)),
              MaterialButton(
                onPressed: () {
                  _logout(context);
                },
                child: Text('Salir',style: TextStyle(color: Colors.red),),
              ),
            ],
          )),
        )),
      )),
    );
  }

  _logout(context) async {
    var loginstate = Provider.of<MyProvider>(context);
    var logout = await FirebaseAuth.instance.signOut().then((_) {
      print('Salio exitosamente');
      loginstate.updateIndex = 0;
      loginstate.updateLogin = false;
    }).catchError((e) {
      print('error al salir');
    });
  }
}
