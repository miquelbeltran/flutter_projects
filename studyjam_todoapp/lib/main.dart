import 'package:flutter/material.dart';
import 'package:studyjam_todoapp/todo.dart';
import 'package:studyjam_todoapp/todo_row.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  final List<Todo> _todos = [
    Todo(
      title: "buy milk",
      isDone: true,
      description: "has to be organic",
      icon: Icons.add_alert,
    ),
    Todo(
      title: "buy milk",
      isDone: true,
      description: "has to be organic",
      icon: Icons.add_alert,
    ),
    Todo(
      title: "buy milk",
      isDone: true,
      description: "has to be organic",
      icon: Icons.add_alert,
    ),
    Todo(
      title: "buy milk",
      isDone: true,
      description: "has to be organic",
      icon: Icons.add_alert,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) => TodoRow(todo: _todos[index]),
        ),
      ),
    );
  }
}
