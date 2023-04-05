import 'package:flutter/material.dart';
import 'package:portfolio/model/pubdev.dart';
import 'package:portfolio/widget/section.dart';
import 'package:portfolio/widget/text.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PubdevWidget extends StatelessWidget {
  const PubdevWidget({
    super.key,
    required this.pubdevs,
    required this.scrollKey,
  });

  final List<Pubdev> pubdevs;
  final GlobalKey scrollKey;

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: EdgeInsets.zero,
      title: "Pub.dev",
      scrollKey: scrollKey,
      child: _PubdevList(pubdevs: pubdevs),
    );
  }
}

class _PubdevList extends StatelessWidget {
  const _PubdevList({required this.pubdevs});
  final List<Pubdev> pubdevs;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      runSpacing: 32,
      children: pubdevs.map((p) => _PubdevContainer(pubdev: p)).toList(),
    );
  }
}

class _PubdevContainer extends StatelessWidget {
  const _PubdevContainer({required this.pubdev});

  final Pubdev pubdev;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlString(pubdev.link),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: Colors.grey.withOpacity(0.25),
        child: SizedBox(
          height: 320,
          width: 240,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(pubdev.image),
                ),
                const SizedBox(height: 8),
                T.h4(pubdev.title),
                T.h6(pubdev.type.title),
                const SizedBox(height: 12),
                T.b3(context, pubdev.preview),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: T.h6(Uri.parse(pubdev.link).origin),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
