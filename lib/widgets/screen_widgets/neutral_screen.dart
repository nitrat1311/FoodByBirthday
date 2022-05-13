import 'package:best_food_by_birthday/assets/text_assets.dart';
import 'package:flutter/material.dart';
import '../../assets/color_assets.dart';
import '../date_picker/date_picker_widget.dart';
import '../../services/links.dart';

class NeutralScreenWidget extends StatelessWidget {
  const NeutralScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = neutralFoodList;
    return Scaffold(
      bottomNavigationBar: const Card(
          color: ColorAssets.bottomBarZeroColor,
          margin: EdgeInsets.only(bottom: 8),
          child: ListTile(
            title: (Links(
              text: TextAssests.instagramLink,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            )),
          )),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(TextAssests.neutralScreenAppBarText),
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
