// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class MyPalette {
  static const Color primary_color = Color.fromRGBO(51, 55, 66, 1);
  static const Color secondary_color = Color.fromRGBO(69, 77, 90, 1);
  static const Color text_field_color = Color.fromRGBO(19, 155, 173, 0.42);

  static const List<BoxShadow> primary_shadow = [
    BoxShadow(
      color: Color.fromRGBO(75, 75, 75, 0.25),
      offset: Offset(10, 10),
      blurRadius: 20,
    ),
    BoxShadow(
      color: Color.fromRGBO(130, 130, 130, 0.16),
      offset: Offset(-10, -10),
      blurRadius: 20,
    ),
  ];
  static const List<BoxShadow> secondary_shadow = [
    BoxShadow(
      color: Color.fromRGBO(50, 50, 50, 0.25),
      blurRadius: 35,
      offset: Offset(-6, -6),
    ),
    BoxShadow(
      color: Color.fromRGBO(130, 130, 130, 0.16),
      blurRadius: 35,
      offset: Offset(6, 6),
    ),
  ];
}
