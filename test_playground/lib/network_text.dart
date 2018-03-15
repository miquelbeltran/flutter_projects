import 'package:flutter/material.dart';
import 'package:test_playground/github_service.dart';

class NetworkText extends StatefulWidget {

  NetworkText({Key key}) : super(key: key);

  @override
  _NetworkTextState createState() => new _NetworkTextState();
}

class _NetworkTextState extends State<NetworkText> {

  String _text = "initial";

  @override
  void initState() {
    super.initState();
    gitHubService.getUsers(0).then((users) {
      setState(() {
        _text = users[0].username;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Text(_text, textDirection: TextDirection.ltr);
  }
}

