class CatProfile {
  String catName;
  String catImage;
  String catAge;
  String catBreed;
  String catDescription;

  CatProfile(
      {String name,
      String image,
      String age,
      String breed,
      String description}) {
    catAge = age;
    catBreed = breed;
    catName = name;
    catDescription = description;
    catImage = image;
  }
}
