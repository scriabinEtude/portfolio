import 'package:flutter/material.dart';

enum MenuButtonType {
  text,
  button,
}

class Menu {
  final String title;
  final String pathName;
  final MenuButtonType type;
  final GlobalKey scrollKey;

  Menu({
    required this.title,
    required this.pathName,
    this.type = MenuButtonType.text,
    required this.scrollKey,
  });
}
