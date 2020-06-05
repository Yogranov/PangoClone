import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pango_clone/services/shared.dart';

class City {

  String name;
  String endTime;

  static List<City> fakeCities = [
    City(name: 'באר שבע', endTime: '20:00'),
    City(name: 'תל אביב', endTime: '19:00'),
    City(name: 'אשדוד', endTime: '18:00'),
    City(name: 'קרית מוצקין', endTime: '17:00'),
    City(name: 'פתח תקווה', endTime: '13:00'),
    City(name: 'בני ברק', endTime: '15:00'),
    City(name: 'אשקלון', endTime: '22:00'),
    City(name: 'כפר סבא', endTime: '16:00'),
    City(name: 'גבעתיים', endTime: '19:30'),
  ];


  City({this.name, this.endTime});
  

  static List<Column> fakeCitiesToContainer(BuildContext context) {
    List<Column> listToExport = List<Column>();
    Column column;

    fakeCities.forEach((city) {
      column = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...Shared.drawLine(),
          InkWell(
            onTap: () {
              Navigator.pop(context, city);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Container(
                      height: 25,
                      child: Column(
                        children: <Widget>[
                          Text(
                            city.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                Container(
                  padding: EdgeInsets.only(right: 30),
                  height: 30,
                  child: 
                    Image.asset('assets/city.png'),
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

  static City passData(City city) {
    return city;
  }

}