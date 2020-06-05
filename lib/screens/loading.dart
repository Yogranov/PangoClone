import 'package:flutter/material.dart';


class Loading extends StatefulWidget {
  
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void timer() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    timer();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Container(
          child: 
            Image.asset('assets/animation.gif'),
        ),
      ),
    );
  }
}
