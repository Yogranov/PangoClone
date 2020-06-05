import 'package:flutter/material.dart';
import 'package:pango_clone/services/shared.dart';

class Sidebar extends StatelessWidget {

  final double lineSpace = 15;

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff1c28a0), Color(0xff3548c8)]
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(0, 70, 0, 10),
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.settings),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 15,),
                      Text(
                        "אזור אישי",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "frizen700@gmail.com",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.1
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: 
                      Image.asset('assets/user.png'),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ...Shared.drawLine("חניה"),
                SizedBox(height: lineSpace),
                Shared.drawRow("חנייה בכחול לבן", "car.png", true),
                SizedBox(height: lineSpace),
                Shared.drawRow("תשלום בחניון\r\r\r", "gate.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("ערים ותעריפים\r\r\r\r", "building.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("צייד חניה\r\r\r\r\r\r", "magnifying-glass.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("?איפה האוטו\r\r\r\r\r", "location.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("הפעלת חנייה פרטית", "car.png"),
                SizedBox(height: lineSpace),
                ...Shared.drawLine("שירותים נוספים"),
                SizedBox(height: lineSpace),
                Shared.drawRow("פנגו סימפל\r\r\r\r", "crown.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("פנגו ביטוח\r\r", "shield.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("פנגו עד הבית\r\r", "hand-key.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("כבישי אגרה\r\r", "road.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("שטיפומט", "wash.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("מערכת בטיחות לרכב\r\r", "signal.png"),
                SizedBox(height: lineSpace),
                ...Shared.drawLine("עזרה בדרך"),
                SizedBox(height: lineSpace),
                Shared.drawRow("תיקון פנצ'ר\r", "flat-tire.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("חילוץ", "battery.png"),
                SizedBox(height: lineSpace),
                Shared.drawRow("לחצן משטרה", "police.png"),
                SizedBox(height: lineSpace),

              ],
            ),
          ),
        ],
      ),
    );
  }
}