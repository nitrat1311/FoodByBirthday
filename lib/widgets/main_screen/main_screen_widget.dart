import 'package:best_food_by_birthday/assets/color_assets.dart';
import 'package:best_food_by_birthday/assets/text_assets.dart';
import 'package:flutter/material.dart';
import 'package:best_food_by_birthday/navigation/main_navigation.dart';
import '../buttons/glowing_button.dart';
import '../../services/links.dart';
import '../date_picker/date_picker_widget.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(TextAssests.appBarText)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: getMainScreenImage(),
            ),
            const SizedBox(height: 10),
            getAppDescription(),
            getLinkForSite(),
            const DatePickerWidget(),
            const SizedBox(height: 20),
            getGlowingButtons()
          ],
        ),
      ),
    );
  }

  Column getGlowingButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const GlowingButton(
          path: MainNavigationRoutes.zero,
          text: TextAssests.neutralButtonName,
          color1: ColorAssets.neutralButtonColorOne,
          color2: ColorAssets.neutralButtonColorTwo,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                flex: 2,
                child: GlowingButton(
                  path: MainNavigationRoutes.plus,
                  text: TextAssests.healthyButtonName,
                  color1: ColorAssets.healthyButtonColorOne,
                  color2: ColorAssets.healthyButtonColorTwo,
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(width: 30),
              ),
              Expanded(
                flex: 2,
                child: GlowingButton(
                  path: MainNavigationRoutes.superPlus,
                  text: TextAssests.curingButtonName,
                  color1: ColorAssets.curingButtonColorOne,
                  color2: ColorAssets.curingButtonColorTwo,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const GlowingButton(
          path: MainNavigationRoutes.minus,
          text: TextAssests.unhealthyButtonName,
          color1: ColorAssets.unHealthyButtonColorOne,
          color2: ColorAssets.unHealthyButtonColorTwo,
        )
      ],
    );
  }

  Center getLinkForSite() {
    return const Center(
        child: Links(
      style: TextStyle(fontSize: 19),
      text: TextAssests.loadTildaLink,
    ));
  }

  SizedBox getAppDescription() {
    return const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            TextAssests.appDescription,
            textAlign: TextAlign.center,
            softWrap: true,
            style:
                TextStyle(fontSize: 16, color: ColorAssets.appDescriptionColor),
          )),
        ));
  }

  SizedBox getMainScreenImage() {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Image.asset(
        TextAssests.imageAssetsPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
