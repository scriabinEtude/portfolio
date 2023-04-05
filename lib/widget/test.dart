import 'package:flutter/material.dart';

class TestBorderContainer extends StatelessWidget {
  const TestBorderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    Color color = brightness == Brightness.light ? Colors.black : Colors.white;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
      child: child,
    );
  }
}
