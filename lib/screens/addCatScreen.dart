import 'package:cat_a_logue/constaants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cat_a_logue/widgets/catImageContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cat_a_logue/widgets/customTextformField.dart';
import 'package:cat_a_logue/widgets/customButton.dart';

class AddCatScreen extends StatefulWidget {
  @override
  _AddCatScreenState createState() => _AddCatScreenState();
}

class _AddCatScreenState extends State<AddCatScreen> {
  File image;
  final picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CameraContainer(
                    image: image,
                    onTap: getImage,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text("  Cat's Name"),
                CustomTextFormField(
                  controller: nameController,
                  hintTexts: "Cat's Name",
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "  Cat's Breed",
                ),
                CustomTextFormField(
                  hintTexts: "Cat's Breed",
                  controller: breedController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text("  Cat's Age"),
                CustomTextFormField(
                  hintTexts: "Cat's Age",
                  controller: ageController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text("  Cat's Description"),
                CustomTextFormFieldMultiLine(
                  hintTexts: 'Description',
                  controller: descriptionController,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                  buttonColor: kPrimaryColor,
                  buttonText: 'Add Cat',
                  textColor: Colors.grey[200],
                )
              ],
            ),
          ),
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
            ? CameraImageContainer()
            : CatImageContainerFile(
                catImage: image,
              ),
      ),
    );
  }
}
