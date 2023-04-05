import 'package:flutter/material.dart';
import 'package:portfolio/model/introduce.dart';
import 'package:portfolio/widget/more.dart';
import 'package:portfolio/widget/section.dart';
import 'package:portfolio/widget/text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroduceWidget extends StatelessWidget {
  const IntroduceWidget({
    super.key,
    required this.introduces,
    required this.scrollKey,
  });

  final List<Introduce> introduces;
  final GlobalKey scrollKey;

  @override
  Widget build(BuildContext context) {
    return Section(
      scrollKey: scrollKey,
      padding: EdgeInsets.zero,
      title: "Introduce",
      child: ScreenTypeLayout.builder(
        breakpoints: const ScreenBreakpoints(
          desktop: 1140,
          tablet: 679,
          watch: 200,
        ),
        desktop: (context) => _IntroduceRow(introduces: introduces),
        tablet: (context) => _IntroduceColumn(
          introduces: introduces,
          width: 600,
        ),
        mobile: (context) => _IntroduceColumn(
          introduces: introduces,
          width: 380,
        ),
      ),
    );
  }
}

class _IntroduceRow extends StatelessWidget {
  const _IntroduceRow({required this.introduces});

  final List<Introduce> introduces;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: introduces
          .map((i) => _IntroduceContainer(
                introduce: i,
                width: 380,
              ))
          .toList(),
    );
  }
}

class _IntroduceColumn extends StatelessWidget {
  const _IntroduceColumn({
    required this.introduces,
    required this.width,
  });

  final List<Introduce> introduces;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: introduces
          .map((i) => Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: _IntroduceContainer(
                  introduce: i,
                  width: width,
                ),
              ))
          .toList(),
    );
  }
}

class _IntroduceContainer extends StatelessWidget {
  const _IntroduceContainer({
    required this.introduce,
    required this.width,
  });
  final Introduce introduce;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: More(
        minHeight: 190.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            T.bold6(introduce.title),
            const SizedBox(height: 20),
            T.b2(context, introduce.introduce),
          ],
        ),
      ),
    );
  }
}
