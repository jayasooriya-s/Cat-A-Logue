import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'package:cat_a_logue/widgets/catImageContainer.dart';

import 'dart:io';

class CatDetailCard extends StatelessWidget {
  final String catName;
  final String catAge;
  final String catBreed;
  final String catDescription;

  CatDetailCard(
      {this.catAge, this.catBreed, this.catDescription, this.catName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        //borderRadius: BorderRadius.circular(25.r),
      ),
      width: 175.w,
      height: 370.h,
      child: Padding(
        padding: EdgeInsets.all(5.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              catName,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                fontWeight: FontWeight.w500,
                color: kFontColor,
              ),
            ),
            Text(
              catAge,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w500,
                color: kFontColor,
              ),
            ),
            Text(
              catBreed,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                fontWeight: FontWeight.w500,
                color: kFontColor,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              catDescription,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                //fontWeight: FontWeight.w500,
                color: kFontColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CatCardContainer extends StatelessWidget {
  final String catName;
  final String catAge;
  final String catBreed;
  final String catDescription;
  final File catImage;

  CatCardContainer(
      {this.catAge,
      this.catBreed,
      this.catDescription,
      this.catImage,
      this.catName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.r),
      child: Container(
        height: 240.h,
        width: 380.w,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(5.0.r),
            child: Row(
              children: [
                CatImageContainerFile(
                  catImage: catImage,
                ),
                CatDetailCard(
                  catAge: catAge,
                  catBreed: catBreed,
                  catDescription: catDescription,
                  catName: catName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
