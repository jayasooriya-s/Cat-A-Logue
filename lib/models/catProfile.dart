import 'dart:io';

class CatProfile {
  String catName;
  File catImage;
  String catAge;
  String catBreed;
  String catDescription;
  CatProfile(
      {this.catAge,
      this.catBreed,
      this.catDescription,
      this.catImage,
      this.catName});

  // CatProfile(
  //     {String name, File image, String age, String breed, String description}) {
  //   catAge = age;
  //   catBreed = breed;
  //   catName = name;
  //   catDescription = description;
  //   catImage = image;
  // }
}
