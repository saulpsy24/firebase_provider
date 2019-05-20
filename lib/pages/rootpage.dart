import 'package:firebase_login_messages/pages/homepage.dart';
import 'package:firebase_login_messages/pages/loginpage.dart';
import 'package:firebase_login_messages/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var login = Provider.of<MyProvider>(context);
    return  login.islogin ? HomePage() : LoginPage();
  }
}
