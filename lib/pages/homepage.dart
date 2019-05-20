import 'package:firebase_login_messages/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../providers/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginstate = Provider.of<MyProvider>(context);
      return loginstate.islogin ? Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: RaisedButton(
              child: Text('Salir'),
              onPressed:() async{
                _logout(context);
              } ,
            ),
          ),
        ),
      ),
    ) : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  _logout(context) async {
    var loginstate = Provider.of<MyProvider>(context);
    var logout = await FirebaseAuth.instance.signOut().then((_) {
      print('Salio exitosamente');
      loginstate.updateLogin =false;
    }).catchError((e){
      print('error al salir');
    });
  }
}
