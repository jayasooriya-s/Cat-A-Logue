import 'package:cat_a_logue/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cat_a_logue/widgets/catImageContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cat_a_logue/widgets/customTextformField.dart';
import 'package:cat_a_logue/widgets/customButton.dart';
import 'package:cat_a_logue/models/catProfile.dart';
import 'package:cat_a_logue/models/catProfileData.dart';
import 'package:provider/provider.dart';

class AddCatScreen extends StatefulWidget {
  // final List<CatProfile> catProfileList;
  // AddCatScreen({this.catProfileList});
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

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('error'),
            content: Text('Please add all field'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                child: new Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

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
                    onPress: () {
                      if (image == null) {
                        _displayDialog(context);
                      } else {
                        final newCatProfile = CatProfile(
                            catAge: ageController.text,
                            catBreed: breedController.text,
                            catDescription: descriptionController.text,
                            catImage: image,
                            catName: nameController.text);

                        Provider.of<CatProfileData>(context, listen: false)
                            .addCatProfile(newCatProfile);
                        Navigator.pop(context);
                      }
                    })
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
