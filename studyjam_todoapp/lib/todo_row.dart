import 'package:flutter/material.dart';
import 'package:studyjam_todoapp/details_screen.dart';
import 'package:studyjam_todoapp/todo.dart';

class TodoRow extends StatelessWidget {
  final Todo todo;

  TodoRow({@required this.todo}) : assert(todo != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsScreen(todo: todo)),
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(todo.icon),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    todo.title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(todo.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
