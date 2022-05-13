import 'package:best_food_by_birthday/assets/color_assets.dart';
import 'package:best_food_by_birthday/assets/text_assets.dart';
import 'package:flutter/material.dart';
import '../../services/links.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Card(
          color: ColorAssets.bottomBarErrorColor,
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: (Links(
              text: TextAssests.instagramLink,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            )),
          )),
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(TextAssests.errorScreenAppBarText)),
      body: const Card(
        margin: EdgeInsets.all(8),
        color: ColorAssets.cardColor,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 35),
          title: Text(
            TextAssests.errorScreenBodyText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
