import 'package:portfolio/model/project.dart';

enum WorkPosition {
  flutterFrontEnd("Front-End Flutter"),
  javaBackEnd("Back-End Java");

  final String title;

  const WorkPosition(this.title);
}

class Company {
  final String title;
  final String logo;
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final WorkPosition position;
  final List<String> achievements;
  final List<Project> projects;

  Company({
    required this.title,
    required this.logo,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.position,
    required this.achievements,
    required this.projects,
  });

  List<Project> get projectWithCompany => projects.map((p) {
        p.company = this;
        return p;
      }).toList();
}
