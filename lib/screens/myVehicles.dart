import 'package:flutter/material.dart';
import 'package:pango_clone/services/shared.dart';
import 'package:pango_clone/models/car.dart';

class MyVehicles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:  MediaQuery.of(context).size.height *0.9,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Center(
            child: Text(
              "?איזה רכב להחנות",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Container(
          height: 800,
              child: 
                ListView(
                  children: <Widget>[
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(right: 15),
                          suffixIcon:
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Transform.rotate(
                                child:
                                  Icon(
                                    Icons.search,
                                    color: Colors.blue[900],
                                    size: 25,
                                  ),
                                  angle: 7.5,
                              ),
                            ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                          ),
                          hintText: "חיפוש",
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    ...Car.fakeCarToColumn(context),
                    SizedBox(height: MediaQuery.of(context).size.height*0.22,),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          icon: Icon(Icons.add_circle),
                          color: Colors.blue[900],
                          iconSize: 62,
                          onPressed: () {},
                      ),
                    ),
                  ],
                ),
            ),
      ),
    );
  }
}