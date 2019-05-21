import 'package:flutter/material.dart';

class Horizontalscroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 100,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: 60.0,
                height: 60,
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Icon(Icons.ac_unit),
              ),
              Text(
                "Anahuac",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: 60.0,
                height: 60,
                decoration:
                    BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
                child: Icon(Icons.add),
              ),
              Text(
                "Tec",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: 60.0,
                height: 60,
                decoration:
                    BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                child: Icon(Icons.ac_unit),
              ),
              Text(
                "Anahuac",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                width: 60.0,
                height: 60,
                decoration:
                    BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle),
                child: Icon(Icons.ac_unit),
              ),
              Text(
                "IPN",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 60.0,
            decoration:
                BoxDecoration(color: Colors.pinkAccent, shape: BoxShape.circle),
            child: Icon(Icons.ac_unit),
          ),
          Container(
            width: 60.0,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            child: Icon(Icons.ac_unit),
          ),
          Container(
            width: 60.0,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.greenAccent, shape: BoxShape.circle),
            child: Icon(Icons.ac_unit),
          ),
        ],
      ),
    );
  }
}
