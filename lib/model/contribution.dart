class Contribution {
  final int front;
  final int back;
  final int pd;

  /// ### 기획
  final int design;

  /// ### 프론트 기여도
  final double contribution;

  Contribution({
    required this.front,
    required this.back,
    required this.pd,
    required this.design,
    required this.contribution,
  }) : assert(contribution <= 1, "기여도는 1 (100%)을 넘길 수 없습니다.");

  int get total => front + back + pd + design;

  @override
  String toString() {
    return "($total) 프론트: $front 백: $back 기획: $pd 디자인: $design";
  }
}
