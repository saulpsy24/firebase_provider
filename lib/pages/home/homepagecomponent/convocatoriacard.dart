import 'package:flutter/material.dart';

class CardConvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      child: Stack(
        children: <Widget>[
          Container(
            width: queryData.size.width *.3,
            height: queryData.size.height * .17,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 88, 109, 140),
                borderRadius: BorderRadius.circular(15)),
          ),
          Container(
            width: queryData.size.width * .09,
            height: queryData.size.width *.09,
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(126, 126, 255, 1)),
            child: Icon(Icons.perm_camera_mic),
          ),
          Container(
            margin: EdgeInsets.only(top:60,left: 10),
            child: Text("IPN", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
          ),
           Container(
            width: queryData.size.width *.3,
            height: queryData.size.height *.09,
            margin: EdgeInsets.only(top:80,left: 10),
            child: Text("Asegura Tu Futuro ingresando a la universidad", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12)),
          )
        ],
      ),
    );
  }
}