import 'package:flutter/material.dart';
import 'package:portfolio/model/menu.dart';
import 'package:portfolio/screen/header/components/app_drawer_opener.dart';
import 'package:portfolio/screen/header/components/menu_list_tile.dart';
import 'package:portfolio/screen/header/components/theme_switch.dart';

import 'package:portfolio/widget/logo.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.menus,
  });

  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: ScreenTypeLayout.builder(
        desktop: (context) => _MenuList(
          menus: menus,
        ),
        tablet: (context) => const AppDrawerOpener(),
        mobile: (context) => const AppDrawerOpener(),
      ),
    );
  }
}

class _MenuList extends StatelessWidget {
  const _MenuList({
    required this.menus,
  });
  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: menus
              .map((m) => MenuListTile(
                    menu: m,
                  ))
              .toList(),
        ),
        const SizedBox(width: 20),
        const ThemeSwitch(),
      ],
    );
  }
}

class _LogoHeader extends StatelessWidget {
  const _LogoHeader({
    required this.right,
  });

  final Widget right;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        SizedBox(
          height: 50,
          child: right,
        ),
      ],
    );
  }
}
