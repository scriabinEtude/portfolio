import 'package:flutter/material.dart';
import 'package:portfolio/common/animation.dart';
import 'package:portfolio/common/key.dart';
import 'package:portfolio/model/menu.dart';
import 'package:portfolio/screen/header/header.dart';
import 'package:portfolio/widget/logo.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.menus,
  });

  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const _Logo(),
      elevation: 0,
      leadingWidth: 78,
      actions: [Header(menus: menus)],
      floating: true,
      expandedHeight: 60,
      backgroundColor:
          Theme.of(context).colorScheme.background.withOpacity(0.8),
      shadowColor: Colors.transparent,
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Scrollable.ensureVisible(
            Keys.menuHomeKey.currentContext!,
            duration: kDuration,
            curve: kCurve,
          );
        },
        child: const Logo(),
      ),
    );
  }
}
