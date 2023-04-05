import 'package:flutter/material.dart';

extension SizeExtension on Size {
  double widthRatio(double ratio) => width * ratio;
  double get widthRatio02 => widthRatio(0.02);
  double get widthRatio08 => widthRatio(0.08);
  double get widthRatio12 => widthRatio(0.12);
  double get widthRatio16 => widthRatio(0.16);
  double get widthRatio24 => widthRatio(0.24);
  double get widthRatio70 => widthRatio(0.70);
  double get widthRatio60 => widthRatio(0.60);
  double get widthRatio80 => widthRatio(0.80);
}
