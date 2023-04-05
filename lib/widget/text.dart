import 'package:flutter/material.dart';
import 'package:portfolio/common/color.dart';

class T extends Text {
  const T(
    super.data, {
    super.key,
    super.style,
    super.textAlign,
  });

  factory T.menu(
    String data, {
    Color? color,
    TextAlign? textAlign,
  }) {
    return T(
      data,
      style: TextStyle(
        color: color,
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
      ),
      textAlign: textAlign,
    );
  }

  factory T.head(String data, double size) {
    return T(
      data,
      style: TextStyle(
        fontSize: size,
        height: 1.6,
      ),
    );
  }

  factory T.h1(String data) => T.head(data, 32);
  factory T.h2(String data) => T.head(data, 28);
  factory T.h3(String data) => T.head(data, 24);
  factory T.h4(String data) => T.head(data, 20);
  factory T.h5(String data) => T.head(data, 16);
  factory T.h6(String data) => T.head(data, 12);

  factory T.body(BuildContext context, String data, double size) {
    return T(
      data,
      style: TextStyle(
        fontSize: size,
        color: Theme.of(context).colorScheme.inverseSurface,
        height: 1.6,
      ),
    );
  }

  factory T.b1(BuildContext context, String data) => T.body(context, data, 16);
  factory T.b2(BuildContext context, String data) => T.body(context, data, 14);
  factory T.b3(BuildContext context, String data) => T.body(context, data, 12);

  factory T.title(String data, double size) {
    return T(
      data,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: kFlutterPrimarySky,
      ),
    );
  }

  factory T.t1(String data) => T.title(data, 36);
  factory T.t2(String data) => T.title(data, 32);
  factory T.t3(String data) => T.title(data, 28);

  factory T.bold(String data, double size) {
    return T(
      data,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory T.bold1(String data) => T.bold(data, 32);
  factory T.bold2(String data) => T.bold(data, 30);
  factory T.bold3(String data) => T.bold(data, 28);
  factory T.bold4(String data) => T.bold(data, 24);
  factory T.bold5(String data) => T.bold(data, 20);
  factory T.bold6(String data) => T.bold(data, 16);

  factory T.background(BuildContext context, String data, double size) {
    return T(
      data,
      style: TextStyle(
        fontSize: size,
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
        height: 1.6,
      ),
    );
  }

  factory T.bg1(BuildContext context, String data) =>
      T.background(context, data, 36);
  factory T.bg2(BuildContext context, String data) =>
      T.background(context, data, 32);
  factory T.bg3(BuildContext context, String data) =>
      T.background(context, data, 28);
}
