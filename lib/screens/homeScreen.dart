import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cat_a_logue/constants.dart';

import 'addCatScreen.dart';
import 'package:cat_a_logue/widgets/catCarddetail.dart';
import 'package:provider/provider.dart';
import 'package:cat_a_logue/models/catProfileData.dart';
import 'package:cat_a_logue/screens/editCatProfileScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCatScreen()));
        },
        child: Icon(Icons.pets_sharp),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey[300],
              height: 160.h,
              width: double.infinity,
              child: Row(
                children: [
                  Image(
                    width: 300.w,
                    fit: BoxFit.cover,
                    image: AssetImage('images/catAlogueLogo.png'),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r)),
              ),
              height: 650.h,
              width: double.infinity,
              child: Provider.of<CatProfileData>(context)
                          .catProfileList
                          .length ==
                      0
                  ? Center(child: Text('Add cat by clicking the button'))
                  : ListView.builder(
                      itemCount: Provider.of<CatProfileData>(context)
                          .catProfileList
                          .length,
                      // ignore: non_constant_identifier_names
                      itemBuilder: (BuildContext, int index) {
                        return GestureDetector(
                          child: CatCardContainer(
                            catAge: Provider.of<CatProfileData>(context)
                                .catProfileList[index]
                                .catAge,
                            //catAge: catProfileList[index].catAge,
                            catBreed: Provider.of<CatProfileData>(context)
                                .catProfileList[index]
                                .catBreed,
                            catDescription: Provider.of<CatProfileData>(context)
                                .catProfileList[index]
                                .catDescription,
                            catImage: Provider.of<CatProfileData>(context)
                                .catProfileList[index]
                                .catImage,
                            catName: Provider.of<CatProfileData>(context)
                                .catProfileList[index]
                                .catName,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditCatScreen(
                                  index: index,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
