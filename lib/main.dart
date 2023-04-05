import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/module/responsive.dart';
import 'package:portfolio/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Responsive.init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}
