import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cat_a_logue/widgets/catImageContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCatScreen extends StatefulWidget {
  @override
  _AddCatScreenState createState() => _AddCatScreenState();
}

class _AddCatScreenState extends State<AddCatScreen> {
  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
    );

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15.0.r),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                CameraContainer(
                  image: image,
                  onTap: getImage,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class CameraContainer extends StatelessWidget {
  final File image;
  final Function onTap;
  CameraContainer({this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: image == null
            ? CameraImageContainer(
                catImage:
                    'https://image.flaticon.com/icons/png/512/685/685672.png',
              )
            : CatImageContainerFile(
                catImage: image,
              ),
      ),
    );
  }
}
