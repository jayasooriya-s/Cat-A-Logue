import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cat_a_logue/constaants.dart';
import 'package:cat_a_logue/models/catProfile.dart';
import 'package:cat_a_logue/widgets/catImageContainer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CatProfile> catProfileList = [
    CatProfile(
      age: '2',
      breed: 'american bob',
      description: 'isufiudhcfiuhdnhcihsdcuduc',
      image:
          'https://images.pexels.com/photos/5989344/pexels-photo-5989344.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
      name: 'Boby boby',
    ),
    CatProfile(
      age: '3',
      breed: 'american tommy',
      description: 'isufiudhcfiuhdnhcihsdcuduc',
      image:
          'https://images.pexels.com/photos/5046925/pexels-photo-5046925.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      name: 'Boby boby',
    ),
  ];

  addCat() {
    CatProfile newCat = CatProfile(
      age: '3',
      breed: 'hcjsd',
      description: 'jcfhdjc',
      image:
          'https://images.pexels.com/photos/6005422/pexels-photo-6005422.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      name: 'Ramumuu',
    );
    setState(() {
      catProfileList.add(newCat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          addCat();
        },
        child: Icon(Icons.pets_sharp),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey[300],
              height: 110.h,
              child: Image(
                image: AssetImage('images/catlogocopy.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r)),
              ),
              height: 700.h,
              child: ListView(
                children: catProfileList
                    .map((e) => CatCardContainer(
                          catAge: e.catAge,
                          catBreed: e.catBreed,
                          catDescription: e.catDescription,
                          catImage: e.catImage,
                          catName: e.catName,
                        ))
                    .toList(),
                // children: [
                //   CatCardContainer(
                //     catName: 'bobby',
                //     catAge: '2 years',
                //     catBreed: 'american boss',
                //     catDescription:
                //         't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point ',
                //     catImage:
                //         'https://images.pexels.com/photos/5989344/pexels-photo-5989344.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                //   ),
                //   CatCardContainer(
                //     catAge: catProfileList[0].catAge,
                //     catBreed: catProfileList[0].catBreed,
                //     catDescription: catProfileList[0].catDescription,
                //     catImage: catProfileList[0].catImage,
                //     catName: catProfileList[0].catName,
                //   ),
                //   CatCardContainer(
                //     catAge: catProfileList[1].catAge,
                //     catBreed: catProfileList[1].catBreed,
                //     catDescription: catProfileList[1].catDescription,
                //     catImage: catProfileList[1].catImage,
                //     catName: catProfileList[1].catName,
                //   )
                // ],
              ),
            ),
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
  final String catImage;

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
                CatImageContainer(
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
