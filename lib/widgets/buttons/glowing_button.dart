import 'package:best_food_by_birthday/assets/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:best_food_by_birthday/navigation/main_navigation.dart';
import '../date_picker/date_picker_widget.dart';

class GlowingButton extends StatefulWidget {
  const GlowingButton({
    Key? key,
    this.path = MainNavigationRoutes.main,
    this.text = '',
    this.color1 = Colors.cyan,
    this.color2 = Colors.greenAccent,
  }) : super(key: key);

  final Color color1;
  final Color color2;
  final String path;
  final String text;

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  var glowing = false;
  var scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onTapCancel: () {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onTapDown: (val) {
        setState(() {
          scale = 1.1;
          glowing = true;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 46,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
            colors: [widget.color1, widget.color2],
          ),
          boxShadow: glowing
              ? [
                  BoxShadow(
                    color: widget.color1.withOpacity(0.8),
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: widget.color2.withOpacity(0.8),
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: widget.color1.withOpacity(0.8),
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: widget.color2.withOpacity(0.8),
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                ]
              : [],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
            style: const ButtonStyle(
                splashFactory: NoSplash.splashFactory, enableFeedback: false),
            child: (Text(
              widget.text,
              style: const TextStyle(
                  color: ColorAssets.glowingButtonTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
            onPressed: () {
              if (zodiacError == true) {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(MainNavigationRoutes.error);
              } else {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(widget.path);
              }
            },
          ),
        ]),
      ),
    );
  }
}
