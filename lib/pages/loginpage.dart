import 'package:firebase_login_messages/pages/registerpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: ChangeNotifierProvider(
        builder: (context) => MyProvider(),
        child: SafeArea(
            child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      keyboardType: TextInputType.emailAddress,
                      attribute: "email",
                      decoration: InputDecoration(labelText: "Email"),
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'Debes Introducir un email valido'),
                        FormBuilderValidators.max(20),
                      ],
                    ),
                    FormBuilderTextField(
                      obscureText: true,
                      attribute: "password",
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
                  MaterialButton(
                    child: Text("Submit"),
                    onPressed: () {
                      _fbKey.currentState.save();
                      if (_fbKey.currentState.validate()) {
                        var _email = _fbKey.currentState.value["email"];
                        var _password = _fbKey.currentState.value["password"];
                        _handleSignIn(_email, _password, context);
                      }
                    },
                  ),
                  MaterialButton(
                    child: Text("Registrar"),
                    onPressed: () {
                      final page = ChangeNotifierProvider(builder: (context)=>MyProvider(), child:RegisterPage());
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => page));
                    },
                  ),
                ],
              )
            ],
          ),
        ])),
      ),
    );
  }

  Future<FirebaseUser> _handleSignIn(_email, _password, context) async {
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
  }
}
