import 'package:firebase_login_messages/pages/home/homepagecomponent/hpcomponent.dart';
import 'package:firebase_login_messages/pages/home/homepagecomponent/popular.dart';
import './homepagecomponent/proximasconvocatorias.dart';
import 'package:flutter/material.dart';

import 'homepagecomponent/horizontalscroll.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      color: Colors.blue,
      width: queryData.size.width,
      height: queryData.size.height,
      child: SafeArea(
        child: Container(
        
        child: ListView(children: <Widget>[
          BannerHP(),
          Horizontalscroll(),
          Popular(),
          ProximasConvocatorias()
        ],),
      ),
      )

    );
  }
}