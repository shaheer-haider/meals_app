import 'package:flutter/material.dart' show Color, Colors;

class Category {
  final String id;
  final String title;
  final Color color;
  const Category(
    this.id,
    this.title, [
    this.color = Colors.orange,
  ]);
}
