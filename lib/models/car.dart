import 'package:flutter/material.dart';
import 'package:pango_clone/screens/home.dart';
import 'package:pango_clone/services/shared.dart';

class Car {

  static String imgPath = 'assets/myCar';

  String number;
  String name;
  String img;

  Car({this.number, this.name, this.img});


  static List<Car> fakeList = [
      Car(number:'628-63-452',name: 'הרכב שלי',img: '1'),
      Car(number:'22-943-18',name: 'מיטאקסי',img: '2'),
      Car(number:'28-356-15',name: 'לוחמת אש',img: '3'),
    ];
  

  static List<Column> fakeCarToColumn(BuildContext context) {
    List<Column> listToExport = List<Column>();
    Column column;

    fakeList.forEach((car) {
      column = 
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...Shared.drawLine(),
          InkWell(
            onTap: () {
              Navigator.pop(context, car);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 25,),
                    Container(
                      height: 48,
                      child: Column(
                        children: <Widget>[
                          Text(
                            car.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            car.number,
                            style: TextStyle(
                              letterSpacing: 0.1
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                Container(
                  padding: EdgeInsets.only(right: 30),
                  height: 60,
                  child: 
                    Image.asset(imgPath + car.img + '.png'),
                ),
              ],
            ),
          ),
        ],
      );

      listToExport.add(column);
    });

    return listToExport;
  }



}