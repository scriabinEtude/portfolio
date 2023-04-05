import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/common/animation.dart';
import 'package:portfolio/common/color.dart';
import 'package:portfolio/widget/media_query.dart';
import 'package:portfolio/widget/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppPageView<E> extends StatefulWidget {
  const AppPageView({
    super.key,
    required this.height,
    this.width,
    required this.items,
    required this.builder,
    this.onPageChanged,
    this.mover = true,
    this.pageIndicator = false,
    this.physics,
  });
  final double height;
  final double? width;
  final List items;
  final Widget Function(BuildContext context, E item) builder;
  final void Function(E item)? onPageChanged;
  final bool mover;
  final bool pageIndicator;
  final ScrollPhysics? physics;

  @override
  State<AppPageView<E>> createState() => _AppPageViewState<E>();
}

class _AppPageViewState<E> extends State<AppPageView<E>> {
  final PageController _controller = PageController();

  int _pageIndex = 0;

  bool get isFirst => _pageIndex == 0;
  bool get isLast => _pageIndex == widget.items.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
      widget.onPageChanged?.call(widget.items[index]);
    });
  }

  onLeft() {
    _controller.animateToPage(
      _pageIndex - 1,
      duration: kDuration,
      curve: kCurve,
    );
  }

  onRight() {
    _controller.animateToPage(
      _pageIndex + 1,
      duration: kDuration,
      curve: kCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.items.length,
              itemBuilder: (context, index) =>
                  widget.builder(context, widget.items[index]),
              onPageChanged: onPageChanged,
              physics: widget.physics ?? const NeverScrollableScrollPhysics(),
            ),
          ),
          if (widget.mover && !isFirst)
            Positioned(
              left: MediaQuery.of(context).size.widthRatio02,
              child: _Mover(
                onPressed: onLeft,
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          if (widget.mover && !isLast)
            Positioned(
              right: MediaQuery.of(context).size.widthRatio02,
              child: _Mover(
                onPressed: onRight,
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          if (widget.pageIndicator && widget.items.length > 1)
            Positioned(
              bottom: 18,
              child: SmoothPageIndicator(
                controller: _controller,
                count: widget.items.length,
                effect: const WormEffect(
                  dotHeight: 3,
                  dotWidth: 3,
                  activeDotColor: kFlutterPrimarySky,
                ),
              ),
            ),
          if (widget.pageIndicator && widget.items.length > 1)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: T(
                  "${(_pageIndex + 1)} / ${widget.items.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Mover extends StatelessWidget {
  const _Mover({
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
