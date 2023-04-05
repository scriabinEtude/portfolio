import 'package:flutter/material.dart';
import 'package:portfolio/model/menu.dart';
import 'package:portfolio/screen/header/components/menu_list_tile.dart';
import 'package:portfolio/screen/header/components/theme_switch.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.menus,
  });

  final List<Menu> menus;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: menus
                .map((m) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: MenuListTile(
                        menu: m,
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          const ThemeSwitch(),
        ],
      ),
    );
  }
}
