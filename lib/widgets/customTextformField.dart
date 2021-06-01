import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constaants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.hintTexts,
    this.prefixIcons,
    this.length,
    this.validate,
    this.controller,
  });
  final String hintTexts;
  final IconData prefixIcons;
  final num length;

  final TextEditingController controller;
  final validate;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 200.w,
        // height: 60.h,
        child: TextFormField(
          validator: validate,
          controller: controller,
          keyboardType: TextInputType.name,
          maxLength: length,
          cursorColor: kPrimaryColor,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            color: kFontColor,
          ),
          decoration: InputDecoration(
              // prefixIcon: Icon(
              //   prefixIcons,
              //   size: 24.r,
              // ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(25.r),
              ),
              hintText: hintTexts,
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Colors.black26,
              ),
              filled: true,
              hoverColor: kPrimaryColor,
              focusColor: kPrimaryColor,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(25.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(25.r),
              )),
        ),
      ),
    );
  }
}

class CustomTextFormFieldMultiLine extends StatelessWidget {
  CustomTextFormFieldMultiLine({
    this.hintTexts,
    this.prefixIcons,
    this.length,
    this.validate,
    this.controller,
  });
  final String hintTexts;
  final IconData prefixIcons;
  final num length;

  final TextEditingController controller;
  final validate;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 200.w,
        height: 150.h,

        child: TextFormField(
          maxLines: 4,
          validator: validate,
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLength: length,
          cursorColor: kPrimaryColor,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            color: kFontColor,
          ),
          decoration: InputDecoration(
              // prefixIcon: Icon(
              //   prefixIcons,
              //   size: 24.r,
              // ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(25.r),
              ),
              hintText: hintTexts,
              hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: Colors.black26,
              ),
              filled: true,
              hoverColor: kPrimaryColor,
              focusColor: kPrimaryColor,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(25.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(25.r),
              )),
        ),
      ),
    );
  }
}
