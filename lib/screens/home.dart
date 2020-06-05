import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pango_clone/models/car.dart';
import 'package:pango_clone/models/city.dart';
import 'package:pango_clone/screens/cities.dart';
import 'package:pango_clone/screens/myVehicles.dart';
import 'package:pango_clone/services/mapUtilz.dart';
import 'package:geolocator/geolocator.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Car selectedCar = Car.fakeList[0];
  City selectedCity = City.fakeCities[0];
  String endTime = City.fakeCities[0].endTime;
  String carImage = 'assets/main-car${Car.fakeList[0].img}.png';


  bool unstoppedParking = false;
  bool moved = false;

  bool buttonPress(bool button) => button ? false : true;

  String unstoppedParkingIcon;
  String unstoppedParkingText;

  String movedIcon;
  String movedText;



  bool parking = false;
  Stopwatch stopwatch = Stopwatch();
  


  Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {    
      if(!parking)
        timer.cancel();
      else
        setState(() {});
     });
  }
  
  


  @override
  Widget build(BuildContext context) {

    if(unstoppedParking) {
      unstoppedParkingIcon = 'unstopping-on.png';
      unstoppedParkingText = "חנייה ללא הפסקה' מופעלת'";
    } else {
        unstoppedParkingIcon = 'unstopping-off.png';
        unstoppedParkingText = "חנייה ללא הפסקה' כבויה'";
    }
      

    if(moved){
      movedIcon = 'moved-on.png';
      movedText = 'שירות "זזתי" פועל';
    } else {
        movedIcon = 'moved-off.png';
        movedText = '?"להפעיל שירות "זזתי';
    }
      
    if(parking) {
      stopwatch.start();
      startTimer();
    } else {
      stopwatch.stop();
      stopwatch.reset();
    }


    return Material(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              height: 130,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/menu_bg.png"),
                  fit: BoxFit.fill
                  ),
              ),
              child: Container(
                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                        child: 
                          IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                            iconSize: 35.0,
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                          )
                        ),
                        IconButton(
                          icon: Image.asset('assets/title.png'),
                          iconSize: 300,
                          onPressed: () {},
                        ),
                      ],
                    ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              height: 100,
              child:
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: <Widget>[
                        IconButton(
                          icon: Image.asset('assets/fast-parking.png'),
                          iconSize: 70,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset('assets/pay-road.png'),
                          iconSize: 70,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset('assets/simple.png'),
                          iconSize: 70,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset('assets/rescue.png'),
                          iconSize: 70,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child:
                IconButton(
                  icon: Image.asset('assets/parking-hunt.png'),
                  iconSize: 40,
                  onPressed: () async {
                    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                    MapUtils.openMap(position.latitude,position.longitude);
                  },
                ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 22, 0, 25),
              child:
                !parking ?

                  Center(
                    child: IconButton(
                      icon: Image.asset('assets/' + (parking ? 'stop' : 'start') + '-parking.png'),
                      iconSize: 200,
                      onPressed: () {
                        setState(() {
                          parking = buttonPress(parking);
                        });
                      },
                    ),
                  )

                :
                Stack(
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: Column(
                        children: <Widget> [
                          SizedBox(height: 70,),  
                          Container(
                            child: IconButton(
                              icon: Image.asset('assets/repeat.png'),
                              iconSize: 60,
                              onPressed: () {
                                stopwatch.reset();
                              },
                              ),
                          ),
                          Text("הארכה"),
                        ],
                      ),
                    ),
                    Center(
                      child: IconButton(
                        icon: Image.asset('assets/' + (parking ? 'stop' : 'start') + '-parking.png'),
                        iconSize: 200,
                        onPressed: () {
                          setState(() {
                            if(!parking)
                              parking = true;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 200,
                      child: 
                        Center(
                          child: 
                            Text(
                              '0' + stopwatch.elapsed.toString().substring(0,7),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                    ),
                    Container(
                      height: 190,
                      child: 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              ":שעת סיום\n $endTime",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                    ),
                    Container(
                      width: 390,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget> [
                          SizedBox(height: 70,),  
                          Container(
                            child: IconButton(
                              icon: Image.asset('assets/stop.png'),
                              iconSize: 60,
                              onPressed: () {
                                setState(() {
                                  parking = buttonPress(parking);
                                });
                              },
                              ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text("סיום"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 25,
                  child:
                    Image.asset(carImage)
                ),
                SizedBox(width: 10,),
                Container(
                  height: 50,
                  child:
                    Image.asset('assets/city.png')
                ),
              ],
            ),
            Container(
              child: 
                Table(
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(context: context,isScrollControlled: true , builder: (context) {
                            return MyVehicles();
                          }).then((car) {setState(() {
                            if(car == null)
                              car = Car.fakeList[0];

                            selectedCar = car;
                            carImage = 'assets/main-car${car.img}.png';
                          });});
                        },
                        child: Column(
                          children:[
                            SizedBox(height: 5,),
                            Text(
                              selectedCar.name,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 5,),
                            Text(selectedCar.number),
                            SizedBox(height: 20,),
                          ]
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(context: context,isScrollControlled: true , builder: (context) {
                            return Cities();
                          }).then((city) {setState(() {

                            if(city == null)
                              city = Car.fakeList[0];

                            selectedCity = city;
                            endTime = city.endTime;
                          });});
                        },
                        child: Column(
                          children:[
                            SizedBox(height: 5,),
                            Text(
                              '?באיזה עיר חנית',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 5,),
                            Text(selectedCity.name),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ]
                  ),
                  TableRow(
                    children: [
                      Column(
                        children:[
                          Container(
                            height: 50,
                            child: IconButton(
                              icon: Image.asset('assets/$unstoppedParkingIcon'),
                              iconSize: 95.0,
                              onPressed: () {
                                setState(() {
                                  unstoppedParking = buttonPress(unstoppedParking);
                                });
                              },
                            ),
                          ),
                          Text(unstoppedParkingText),
                          SizedBox(height: 25,)
                      ]),
                      Column(
                        children:[
                          Container(
                            height: 50,
                            child: IconButton(
                              icon: Image.asset('assets/$movedIcon'),
                              iconSize: 95.0,
                              onPressed: () {
                                setState(() {
                                  moved = buttonPress(moved);
                                });
                              },
                            ),
                          ),
                          Text(movedText)
                      ]),
                    ]
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}