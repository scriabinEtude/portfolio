import 'package:flutter/material.dart';
import 'package:portfolio/common/color_schemes.dart';
import 'package:portfolio/common/dataset.dart';
import 'package:portfolio/provider/theme_provider.dart';
import 'package:portfolio/screen/home_screen.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      home: HomeScreen(dataSet: dataSetKor),
    );
  }
}
