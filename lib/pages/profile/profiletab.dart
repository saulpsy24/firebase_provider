import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_messages/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Container(
          child: Center(
            child: RaisedButton(
              onPressed: (){
                _logout(context);

              },
              child: Text('Log Out'),
            ),
          ),
        ),
      ),
    );
  }

   _logout(context) async {
    var loginstate = Provider.of<MyProvider>(context);
    var logout = await FirebaseAuth.instance.signOut().then((_) {
      print('Salio exitosamente');
      loginstate.updateIndex =0;
      loginstate.updateLogin = false;
    }).catchError((e) {
      print('error al salir');
    });
  }
}
