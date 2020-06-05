import 'package:flutter/material.dart';
import 'package:pango_clone/models/car.dart';
import 'package:pango_clone/models/city.dart';


class Shared {

  static List<Widget> drawLine([String title = '']) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Text(title),
      ),
      Padding(
        padding:EdgeInsets.symmetric(horizontal:10.0),
        child:Container(
          height:1.0,
          width:250.0,
          color:Colors.grey[400],
        ),
      ),
    ];
  } 

  static Row drawRow(String text, String icon, [bool current = false]) {
    return
      Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: current ? FontWeight.bold : FontWeight.normal
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Image.asset('assets/sidebar/$icon'),
            ),
          ],
        );
  }


}
