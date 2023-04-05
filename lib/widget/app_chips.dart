import 'package:flutter/material.dart';
import 'package:portfolio/widget/text.dart';

class AppChips extends StatelessWidget {
  const AppChips({
    super.key,
    required this.label,
    required this.active,
  });

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: active
              ? Theme.of(context).colorScheme.inversePrimary.withOpacity(1)
              : Theme.of(context).colorScheme.inverseSurface.withOpacity(0.4),
          width: 0.3,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: active ? T.h6(label) : T.b3(context, label),
    );
  }
}
