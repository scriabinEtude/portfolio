import 'package:flutter/material.dart';
import 'package:portfolio/common/color.dart';
import 'package:portfolio/model/skill_category.dart';
import 'package:portfolio/widget/app_chips.dart';
import 'package:portfolio/widget/media_query.dart';
import 'package:portfolio/widget/section.dart';
import 'package:portfolio/widget/text.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget({
    super.key,
    required this.skills,
    required this.scrollKey,
  });

  final List<SkillCategory> skills;
  final GlobalKey scrollKey;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Skills & Libraries',
      scrollKey: scrollKey,
      child: _SkillList(skills: skills),
    );
  }
}

class _SkillList extends StatelessWidget {
  const _SkillList({required this.skills});
  final List<SkillCategory> skills;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: skills.map((s) => _SkillContainer(skill: s)).toList(),
    );
  }
}

class _SkillContainer extends StatelessWidget {
  const _SkillContainer({required this.skill});

  final SkillCategory skill;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        T.bold4(skill.title),
        const SizedBox(height: 15),
        _Progress(
          percent: skill.percent,
          percentage: skill.percentage,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: MediaQuery.of(context).size.widthRatio60,
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: skill.details
                .map((s) => AppChips(
                      label: s.title,
                      active: s.isMain,
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _Progress extends StatelessWidget {
  const _Progress({
    required this.percent,
    required this.percentage,
  });

  final double percent;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.widthRatio60,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              _Bar(
                percent: 1,
                color: Colors.grey.withOpacity(0.2),
                height: 15,
              ),
              _Bar(
                percent: percent,
                color: kFlutterPrimaryLight,
                height: 15,
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        T.bold6(percentage),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    required this.percent,
    required this.color,
    required this.height,
  });
  final double percent;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: height,
        width: constraints.maxWidth * percent,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      );
    });
  }
}
