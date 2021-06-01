import 'package:cat_a_logue/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constaants.dart';
import 'screens/addCatScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 843),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SLNT',
        theme: ThemeData.light().copyWith(
            accentColor: kPrimaryColor, primaryColorLight: kPrimaryColor),
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
        home: AddCatScreen(),
      ),
    );
  }
}
