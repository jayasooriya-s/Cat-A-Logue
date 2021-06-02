import 'package:cat_a_logue/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class CatImageContainer extends StatelessWidget {
  final String catImage;
  CatImageContainer({this.catImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25.r),
      ),
      width: 175.w,
      height: 370.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(catImage),
        ),
      ),
    );
  }
}

class CatImageContainerFile extends StatelessWidget {
  final File catImage;
  CatImageContainerFile({this.catImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(25.r),
      ),
      width: 175.w,
      height: 200.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: Image.file(
          catImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CameraImageContainer extends StatelessWidget {
  //final String catImage;
  //CameraImageContainer({this.catImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25.r),
      ),
      width: 175.w,
      height: 200.h,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: Icon(
            Icons.camera_alt_outlined,
            size: 130,
            color: kPrimaryColor,
          )),
    );
  }
}
