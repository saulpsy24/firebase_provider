import 'package:firebase_login_messages/pages/loginpage.dart';
import 'package:firebase_login_messages/pages/rootpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../providers/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginstate = Provider.of<MyProvider>(context);
    final page = LoginPage();
    void usuario () async {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: RaisedButton(
                child: Text(''),
                onPressed: () async {
                  _logout(context).then((_) {
                    final page = ChangeNotifierProvider(
                        builder: (context) => MyProvider(), child: RootPage());
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => page));
                  });
                }),
          ),
        ),
      ),
    );
  }

  _logout(context) async {
    var loginstate = Provider.of<MyProvider>(context);
    var logout = await FirebaseAuth.instance.signOut().then((_) {
      print('Salio exitosamente');
      loginstate.updateLogin = false;
    }).catchError((e) {
      print('error al salir');
    });
  }
}
