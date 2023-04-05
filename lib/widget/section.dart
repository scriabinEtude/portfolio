import 'package:flutter/material.dart';
import 'package:portfolio/widget/text.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.title,
    required this.child,
    required this.scrollKey,
    this.padding,
    this.margin,
    this.decoration,
  });

  final String? title;
  final Widget child;
  final GlobalKey scrollKey;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    bool isTitle = title != null;

    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24),
        margin: margin,
        decoration: decoration,
        child: Column(
          children: [
            SizedBox(
              key: isTitle ? null : scrollKey,
              height: 50,
            ),
            if (isTitle)
              Column(
                children: [
                  const SizedBox(height: 150),
                  SizedBox(
                    key: scrollKey,
                    height: 50,
                  ),
                  T.t1(title!),
                ],
              ),
            const SizedBox(height: 80),
            child,
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
