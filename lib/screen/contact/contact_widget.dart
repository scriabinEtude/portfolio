import 'package:flutter/material.dart';
import 'package:portfolio/common/color.dart';
import 'package:portfolio/model/community.dart';
import 'package:portfolio/model/hire_me.dart';
import 'package:portfolio/widget/media_query.dart';
import 'package:portfolio/widget/section.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.hireMe,
    required this.scrollKey,
  });

  final HireMe hireMe;
  final GlobalKey scrollKey;

  @override
  Widget build(BuildContext context) {
    return Section(
      scrollKey: scrollKey,
      title: null,
      margin: const EdgeInsets.fromLTRB(16, 200, 16, 16),
      decoration: BoxDecoration(
        color: kFlutterPrimaryBlue,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.widthRatio08,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              hireMe.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 20,
                fontSize: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                hireMe.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Wrap(
                runSpacing: 16,
                children: hireMe.communities
                    .map((c) => _CommunityButton(community: c))
                    .toList(),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _CommunityButton extends StatelessWidget {
  const _CommunityButton({required this.community});
  final Community community;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: InkWell(
        onTap: community.isUrl ? () => launchUrlString(community.url!) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                community.imagePath,
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 12),
              Text(
                overflow: TextOverflow.fade,
                community.title,
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
