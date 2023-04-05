import 'package:portfolio/model/skill.dart';

class SkillCategory {
  final String title;
  final double percent;
  final List<Skill> details;

  SkillCategory({
    required this.title,
    required this.percent,
    required this.details,
  }) : assert(percent <= 1, "percent can not over 1");
}
