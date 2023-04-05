import 'package:flutter/material.dart';
import 'package:portfolio/common/key.dart';

class AppDrawerOpener extends StatelessWidget {
  const AppDrawerOpener({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Keys.scaffoldKey.currentState?.openEndDrawer(),
      icon: const Icon(
        Icons.menu,
        size: 32,
      ),
    );
  }
}
