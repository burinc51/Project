import 'package:flutter/material.dart';

Color hexToColor(String hexCode) {
  return Color(int.parse(hexCode.replaceFirst('#', '0xFF')));
}