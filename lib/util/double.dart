extension DoubleExtension on double {
  /// ### 0.8645 -> 86
  int get percent => (this * 100).toInt();

  /// ### 0.8645 -> 86%
  String get percentDisplay => "$percent%";
}
