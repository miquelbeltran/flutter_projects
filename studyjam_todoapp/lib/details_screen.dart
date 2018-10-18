import 'package:flutter/material.dart';
import 'package:studyjam_todoapp/todo.dart';

class DetailsScreen extends StatelessWidget {
  final Todo todo;

  DetailsScreen({@required this.todo}) : assert(todo != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Screen")),
      body: Center(
        child: Text(todo.title),
      ),
    );
  }
}
