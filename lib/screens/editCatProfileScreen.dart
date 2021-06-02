import 'package:cat_a_logue/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cat_a_logue/widgets/catImageContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cat_a_logue/widgets/customTextformField.dart';
import 'package:cat_a_logue/widgets/customButton.dart';

import 'package:cat_a_logue/models/catProfileData.dart';
import 'package:provider/provider.dart';

class EditCatScreen extends StatefulWidget {
  final int index;

  EditCatScreen({this.index});
  @override
  _EditCatScreenState createState() => _EditCatScreenState();
}

class _EditCatScreenState extends State<EditCatScreen> {
  File image;
  final picker = ImagePicker();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  //List<CatProfile> catProfileList;

  // addNewProfile() {
  //   CatProfile newCatProfile = CatProfile(
  //       age: ageController.text,
  //       breed: breedController.text,
  //       name: nameController.text,
  //       description: descriptionController.text,
  //       image: image);

  //   widget.catProfileList.add(newCatProfile);
  // }
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
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0.r),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CameraContainer(
                        image: Provider.of<CatProfileData>(context)
                            .catProfileList[widget.index]
                            .catImage,
                        onTap: getImage,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("  Cat's Name"),
                    CustomTextFormField(
                      controller: nameController
                        ..text = Provider.of<CatProfileData>(context)
                            .catProfileList[widget.index]
                            .catName,
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
                      controller: breedController
                        ..text = Provider.of<CatProfileData>(context)
                            .catProfileList[widget.index]
                            .catBreed,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("  Cat's Age"),
                    CustomTextFormField(
                      hintTexts: "Cat's Age",
                      controller: ageController
                        ..text = Provider.of<CatProfileData>(context)
                            .catProfileList[widget.index]
                            .catAge,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("  Cat's Description"),
                    CustomTextFormFieldMultiLine(
                      hintTexts: 'Description',
                      controller: descriptionController
                        ..text = Provider.of<CatProfileData>(context)
                            .catProfileList[widget.index]
                            .catDescription,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomButton(
                      buttonColor: kPrimaryColor,
                      buttonText: 'Add Cat',
                      textColor: Colors.grey[200],
                      onPress: () {
                        Provider.of<CatProfileData>(context, listen: false)
                            .editCatProfile(
                                index: widget.index,
                                newAge: ageController.text,
                                newBreed: breedController.text,
                                newDescription: descriptionController.text,
                                newName: nameController.text,
                                newImage: image);

                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.w,
            child: IconButton(
              icon: Icon(
                Icons.delete,
                size: 30.r,
                color: Colors.red,
              ),
              onPressed: () {
                Provider.of<CatProfileData>(context, listen: false)
                    .deleteCatprofile(widget.index);
                Navigator.pop(
                  context,
                );
              },
            ),
          ),
          Positioned(
            top: 10.h,
            left: 10.w,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30.r,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
            ),
          )
        ],
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
