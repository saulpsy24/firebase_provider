import 'package:firebase_login_messages/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey2 = GlobalKey<FormBuilderState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SafeArea(
          child: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            FormBuilder(
              key: _fbKey2,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    keyboardType: TextInputType.emailAddress,
                    attribute: "registro_email",
                    decoration: InputDecoration(labelText: "Email"),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Debes Introducir un email valido'),
                     
                    ],
                  ),
                  FormBuilderTextField(
                    obscureText: true,
                    attribute: "registro_password",
                    decoration: InputDecoration(labelText: "Password"),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Debes introducir un password'),
                      FormBuilderValidators.minLength(6,
                          errorText:
                              'Introduce un password de minimo 6 caracteres')
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Submito"),
                  onPressed: () {
                    print('aqui entro');
                    _fbKey2.currentState.save();
                    if (_fbKey2.currentState.validate()) {
                      var _emailregistro = _fbKey2.currentState.value["registro_email"];
                      var _passwordregistro = _fbKey2.currentState.value["registro_password"];
                      //_handleSignIn(_emailregistro, _passwordregistro, context);
                    }
                  },
                ),
                MaterialButton(
                  child: Text("Ya tengo cuenta"),
                  onPressed: () {
                    
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  },
                ),
              ],
            )
          ],
        ),
      ])),
    );
  }

 /* Future<FirebaseUser> _handleSignIn(_email, _password, context) async {
    var login = Provider.of<MyProvider>(context);

    print(_email + _password);
    final FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    if (user != null) {
      print(user.uid);
      login.updateLogin = true;
      return user;
    }
    return null;
  } */
}
