import 'package:flutter/material.dart';
import 'package:portfolio/common/animation.dart';
import 'package:portfolio/common/key.dart';
import 'package:portfolio/model/menu.dart';
import 'package:portfolio/widget/text.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    super.key,
    required this.menu,
  });

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;
    TextAlign? textAlign;
    Color? textColor;

    if (menu.type == MenuButtonType.button) {
      decoration = BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
      );
      textAlign = TextAlign.center;
      textColor = Colors.white;
    }

    return SizedBox(
      height: 35,
      child: InkWell(
        onTap: () {
          Scrollable.ensureVisible(
            menu.scrollKey.currentContext!,
            duration: kDuration,
            curve: kCurve,
          );
          Keys.scaffoldKey.currentState?.closeEndDrawer();
        },
        child: Container(
          decoration: decoration,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          child: T.menu(
            menu.title,
            textAlign: textAlign,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
