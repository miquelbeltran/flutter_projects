import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  final bool isDone;
  final IconData icon;

  Todo({
    this.title,
    this.description,
    this.isDone,
    this.icon,
  });
}
