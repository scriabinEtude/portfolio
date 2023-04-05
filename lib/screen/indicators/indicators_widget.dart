import 'package:flutter/material.dart';
import 'package:portfolio/model/indicators.dart';
import 'package:portfolio/widget/text.dart';

class IndicatorsWidget extends StatelessWidget {
  const IndicatorsWidget({
    super.key,
    required this.indicators,
  });

  final Indicators indicators;

  @override
  Widget build(BuildContext context) {
    return _IndicatorsRow(indicators: indicators);
  }
}

class _IndicatorsRow extends StatelessWidget {
  const _IndicatorsRow({required this.indicators});
  final Indicators indicators;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: indicators.indicators
          .map((i) => _IndicatorContainer(indicator: i))
          .toList(),
    );
  }
}

class _IndicatorContainer extends StatelessWidget {
  const _IndicatorContainer({
    required this.indicator,
  });

  final Indicator indicator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          T.h4(indicator.title),
          const SizedBox(height: 5),
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            color: Colors.grey.withOpacity(0.1),
            child: SizedBox(
              height: 220,
              width: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  T.bg1(context, indicator.number),
                  const SizedBox(height: 30),
                  T.b2(context, indicator.tooltip),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
