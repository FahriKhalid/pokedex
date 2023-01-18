import 'package:flutter/material.dart';

class ColorPokemon {
  ColorPokemon(String s);

  static set(color) {
    if (color == "brown") {
      return Colors.brown[300];
    } else if (color == "yellow") {
      return Color(0xFFffd76f);
    } else if (color == "red") {
      return Color(0xFFf88288);
    } else if (color == "green") {
      return Color(0xFF4fd1b8);
    } else if (color == "blue") {
      return Color(0xFF76bcfe);
    } else if (color == "white") {
      return Colors.grey[350];
    } else if (color == "purple") {
      return Color.fromARGB(255, 217, 139, 231);
    } else {
      return Colors.grey[400];
    }
  }
}
