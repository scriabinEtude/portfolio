class Indicators {
  final DateTime birth;
  final DateTime since;
  final int projectCount;

  /// libraries + lectures + others
  final int communities;

  Indicators({
    required this.birth,
    required this.since,
    required this.projectCount,
    required this.communities,
  });

  Duration toNow(DateTime from) => DateTime.now().difference(from);

  int get age => toNow(birth).inDays ~/ 365;
  int get experience => (toNow(since).inDays / 365).ceil();

  List<Indicator> get indicators => [
        Indicator(
          title: 'AGE',
          number: "$age",
          tooltip: "만 나이",
        ),
        Indicator(
          title: 'EXPERIENCE',
          number: "$experience",
          tooltip: "years",
        ),
        Indicator(
          title: 'PROJECTS',
          number: "$projectCount+",
          tooltip: "",
        ),
        Indicator(
          title: 'COMMUNITIES',
          number: "$communities",
          tooltip: "libraries + lectures + ...",
        ),
      ];
}

class Indicator {
  final String title;
  final String number;
  final String tooltip;

  Indicator({
    required this.title,
    required this.number,
    required this.tooltip,
  });
}
