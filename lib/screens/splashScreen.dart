import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: Center(
        //   // child: Image(
        //   //   height: 300.r,
        //   //   width: 300.r,
        //   //   image: AssetImage('images/catAlogueLogo.png'),
        //   // ),
        // ),
        child: Stack(
          children: [
            Positioned(
              top: 200.h,
              bottom: 200.h,
              right: 80.w,
              left: 5.w,
              child: Image(
                height: 100.r,
                width: 100.r,
                image: AssetImage('images/catAlogueLogo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
