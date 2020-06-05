import 'package:flutter/material.dart';
import 'package:pango_clone/screens/loading.dart';
import 'package:pango_clone/screens/sidebar.dart';
import 'screens/home.dart';
void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => MyApp(),
    }
));





class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: 
      ThemeData(
        backgroundColor: Color(0xfffafafa),
        canvasColor: Color(0xfffafafa), 
        textTheme: TextTheme(
          headline6: TextStyle(color:  Colors.grey[800]),
          bodyText2: TextStyle(color: Colors.grey[800]),
        ),
      ),
      darkTheme: ThemeData.dark(), 
      // ThemeData(
      //   primaryColor: Colors.grey[200],
      //   scaffoldBackgroundColor: Color(0x2e2e2e),
      //   canvasColor: Colors.grey[900],
      //   cardTheme: CardTheme(color: Colors.grey[900]),
        
      //   textTheme: Theme.of(context).textTheme.apply(
      //     bodyColor: Colors.grey[200],
      //     displayColor: Colors.grey[200],
      //   ),
      // ),
      home: PangoMain(),
    );
  }
}


class PangoMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
          child: Scaffold(
            drawer: Sidebar(),
            body: Home()
          ),
      );
  }
}
