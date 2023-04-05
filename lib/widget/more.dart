import 'package:flutter/material.dart';
import 'package:portfolio/widget/text.dart';

class More extends StatefulWidget {
  final Widget child;
  final double minHeight;

  const More({
    super.key,
    required this.child,
    required this.minHeight,
  });

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  void onTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.background,
      focusColor: Theme.of(context).colorScheme.background,
      hoverColor: Theme.of(context).colorScheme.background,
      highlightColor: Theme.of(context).colorScheme.background,
      onTap: onTap,
      child: Stack(
        children: [
          if (!_isExpanded)
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: widget.minHeight),
              child: ClipRRect(
                child: widget.child,
              ),
            )
          else
            widget.child,
          if (!_isExpanded)
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _Handler(),
            ),
        ],
      ),
    );
  }
}

class _Handler extends StatelessWidget {
  const _Handler();

  @override
  Widget build(BuildContext context) {
    return _Gradient(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: T.h6('더 보기'),
      ),
    );
  }
}

class _Gradient extends StatelessWidget {
  const _Gradient({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.background.withOpacity(0),
              Theme.of(context).colorScheme.background,
            ],
            stops: const [
              0.0,
              0.8,
            ]),
      ),
      child: child,
    );
  }
}
