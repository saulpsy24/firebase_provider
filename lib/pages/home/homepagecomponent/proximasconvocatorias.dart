
import 'package:firebase_login_messages/pages/home/homepagecomponent/convocatoriacard.dart';
import 'package:flutter/material.dart';

class ProximasConvocatorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CardConvo(),
        CardConvo(),
        CardConvo()
      ],),
    );
  }
}
