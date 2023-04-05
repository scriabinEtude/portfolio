class Term {
  // ignore: constant_identifier_names
  static const List<int> DAYS_IN_MONTHS = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  final DateTime start;
  final DateTime end;
  final bool onGoing;

  /// ### end가 없으면 현재진행으로 판단하고 [onGoing] `= true`
  Term({required this.start, DateTime? end})
      : end = end ?? DateTime.now(),
        onGoing = end == null;

  Duration get duration => end.difference(start);
  int get inYear => duration.inDays ~/ 365;
  int get inMonth {
    int days = duration.inDays % 365;
    for (var i = 0; i < DAYS_IN_MONTHS.length; i++) {
      days -= DAYS_IN_MONTHS[i];
      if (days < 0) {
        return i;
      }
    }
    return DAYS_IN_MONTHS.length;
  }

  /// ### 1년 6개월
  String get durationDisplay {
    List<String> displays = [];
    if (inYear != 0) {
      displays.add("$inYear년");
    }

    if (inMonth != 0) {
      displays.add("$inMonth개월");
    }

    return displays.join(" ");
  }

  /// ### 2019년 2월 ~ 2022년 12월
  String get termDisplay =>
      "${_getYearMonth(start)} ~ ${onGoing ? "" : _getYearMonth(end)}";

  String _getYearMonth(DateTime date) {
    return "${date.year}년 ${date.month}월";
  }
}
