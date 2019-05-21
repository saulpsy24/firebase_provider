import 'package:flutter/material.dart';

class BannerHP extends StatelessWidget {
 
 

  
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage("assets/graduated.jpg"),
                    fit: BoxFit.cover)),
            height: queryData.size.height * .2,
            width: queryData.size.width * .85,
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(150, 255, 239, 173)),
             height: queryData.size.height * .2,
            width: queryData.size.width * .85,
            child: Container(
              padding: EdgeInsets.only(top: 50, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Entra a la",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 47, 72, 112)),
                  ),
                  Text("Universidad",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 47, 72, 112)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
