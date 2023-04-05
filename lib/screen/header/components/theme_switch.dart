import 'package:flutter/material.dart';
import 'package:portfolio/common/color.dart';
import 'package:portfolio/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var isLight = provider.isLight(context);

    return IconButton(
      onPressed: () => provider.setThemeByBool(!isLight),
      icon: isLight
          ? const Icon(
              Icons.dark_mode,
              color: kFlutterPrimaryDark,
            )
          : const Icon(
              Icons.light_mode,
              color: Colors.yellow,
            ),
    );
  }
}
