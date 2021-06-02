import 'package:cat_a_logue/models/catProfile.dart';
import 'dart:io';

// class CatProfileList {
//   List<CatProfile> catProfileList = [];
//   CatProfile catProfileItem = CatProfile(age: )
// }

import 'package:flutter/foundation.dart';

class CatProfileData extends ChangeNotifier {
  List<CatProfile> catProfileList = [];

  void addCatProfile(CatProfile newCatProfile) {
    catProfileList.add(newCatProfile);
    notifyListeners();
  }

  void deleteCatprofile(index) {
    catProfileList.removeAt(index);
    notifyListeners();
  }

  void editCatProfile(
      {String newName,
      String newBreed,
      String newAge,
      String newDescription,
      File newImage,
      int index}) {
    catProfileList[index].catAge = newAge;

    catProfileList[index].catName = newName;

    catProfileList[index].catBreed = newBreed;

    catProfileList[index].catDescription = newDescription;

    catProfileList[index].catImage = newImage;

    notifyListeners();
  }
}
