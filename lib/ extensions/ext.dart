import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App {
  static SharedPreferences? sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

Color parseColor(String color) {
  String hex = color.replaceAll("#", "");
  if (hex.isEmpty) hex = "ffffff";
  if (hex.length == 3) {
    hex =
    '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
  return col;
}

Future<SharedPreferences> getSharedPreferences() async {
  return await SharedPreferences.getInstance();
}

double getWidth(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}

extension DynamicSize on State {
  double gw(double size) {
    return MediaQuery.of(context).size.width * size;
  }

  double gh(double size) {
    return MediaQuery.of(context).size.height * size;
  }
}

extension DynamicSizeStateless on StatelessWidget {
  double gw(double size, BuildContext context) {
    return MediaQuery.of(context).size.width * size;
  }

  double gh(double size, BuildContext context) {
    return MediaQuery.of(context).size.height * size;
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension E on String {
  String lastChars(int n) => substring(length - n);
}
