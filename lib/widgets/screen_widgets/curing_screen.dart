import 'package:best_food_by_birthday/assets/color_assets.dart';
import 'package:best_food_by_birthday/assets/text_assets.dart';
import 'package:flutter/material.dart';
import '../date_picker/date_picker_widget.dart';
import '../../services/links.dart';

class CuringScreenWidget extends StatelessWidget {
  const CuringScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = curingFoodList;

    return Scaffold(
      bottomNavigationBar: const Card(
          color: Colors.blue,
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: (Links(
              text: TextAssests.instagramLink,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            )),
          )),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(TextAssests.curingScreenAppBarText),
      ),
      body: ListView.builder(
        itemCount: model.length,
        itemBuilder: (_, int index) {
          return Card(
            margin: const EdgeInsets.all(8),
            color: ColorAssets.cardColor,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 35),
              title: Text(
                model[index][0].toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              trailing: Text(
                model[index][1].toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          );
        },
      ),
    );
  }
}
