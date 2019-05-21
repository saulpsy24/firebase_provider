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
        body: ChangeNotifierProvider(
      builder: (context) => MyProvider(),
      child: Container(
        color: Colors.blue,
        child: SafeArea(
            child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .1),
                width: MediaQuery.of(context).size.width*.5,
                height: MediaQuery.of(context).size.width*.5,
                decoration:BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage('assets/books.png')
                  )
                )
              ),
              Card(
                  child: Container(
                    
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: FormBuilder(
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
              )),
              Column(
                children: <Widget>[
                  MaterialButton(
                    child: Text("Entrar"),
                    color: Colors.yellow,
                    shape: StadiumBorder(),
                    

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
                    color: Colors.yellowAccent,
                    shape: StadiumBorder(),
                    onPressed: () {
                      final page = ChangeNotifierProvider(
                          builder: (context) => MyProvider(),
                          child: RegisterPage());
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
    ));
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
