import 'package:flutter/material.dart';
import 'package:portfolio/model/indicators.dart';
import 'package:portfolio/model/intro.dart';
import 'package:portfolio/screen/indicators/indicators_widget.dart';
import 'package:portfolio/widget/media_query.dart';
import 'package:portfolio/widget/section.dart';
import 'package:portfolio/widget/text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    super.key,
    required this.intro,
    required this.indicators,
    required this.scrollKey,
  });

  final Intro intro;
  final Indicators indicators;
  final GlobalKey scrollKey;

  @override
  Widget build(BuildContext context) {
    return Section(
      scrollKey: scrollKey,
      title: null,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          ScreenTypeLayout.builder(
            breakpoints: const ScreenBreakpoints(
              desktop: 840,
              tablet: 710,
              watch: 200,
            ),
            desktop: (context) => _SummaryAndImage(
              intro: intro,
              mainWidth: 920,
              imageWidth: 340,
            ),
            tablet: (context) => _SummaryAndImage(
              intro: intro,
              mainWidth: 800,
              imageWidth: 210,
            ),
            mobile: (context) => _Mobile(intro: intro),
            watch: (context) => _Mobile(intro: intro),
          ),
          const SizedBox(height: 150),
          IndicatorsWidget(indicators: indicators),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({
    required this.intro,
  });

  final Intro intro;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _IntroSummary(intro: intro),
        const SizedBox(height: 50),
        _ProfileImage(
          image: intro.image,
          width: 240,
        ),
      ],
    );
  }
}

class _SummaryAndImage extends StatelessWidget {
  const _SummaryAndImage({
    required this.intro,
    required this.mainWidth,
    required this.imageWidth,
  });
  final Intro intro;
  final double mainWidth;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mainWidth,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _IntroSummary(intro: intro),
          _ProfileImage(
            image: intro.image,
            width: imageWidth,
          ),
        ],
      ),
    );
  }
}

class _IntroSummary extends StatelessWidget {
  const _IntroSummary({
    required this.intro,
  });
  final Intro intro;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T.h1(intro.title),
          const SizedBox(height: 50),
          T.b2(context, intro.subtitle),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    required this.image,
    required this.width,
  });
  final String image;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: width,
      fit: BoxFit.fitWidth,
    );
    // return Container(
    //   width: width,
    //   height: width,
    //   decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    // );
  }
}
