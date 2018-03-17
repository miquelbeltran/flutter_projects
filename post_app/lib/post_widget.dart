import 'package:flutter/material.dart';
import 'package:post_app/post_value.dart';


class PostWidget extends StatelessWidget {

  final Post _post;

  PostWidget(this._post);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.all(8.0),
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Header(),
            new Line(),
            new Title(_post.title),
            new Body(_post.body),
            new Line(),
            new Author(_post.author)
          ],
        ),
      ),
    );
  }
}

var _white2 = new Color(0xFFD7D7D7);
var _black1 = new Color(0xFF9C9C9C);

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Padding(
              padding: new EdgeInsets.all(8.0),
              child: new Text(
                "Mitteilung - Frage",
                style: new TextStyle(color: _black1),
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Image(
                image: new AssetImage("images/ic_info.png")),
          ),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: _white2),
      height: 1.0,
    );
  }
}

class Title extends StatelessWidget {

  final String _title;

  Title(this._title);

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Text(
          _title,
          style: new TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600
          ),
        )
    );
  }
}

class Body extends StatelessWidget {

  final String _body;

  Body(this._body);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: new Text(_body)
    );
  }
}

class Author extends StatelessWidget {

  final String _author;

  Author(this._author);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage("https://place.cat/c/100/100"),
            )
        ),
        new Column(
          children: <Widget>[
            new Text(
              _author,
              style: new TextStyle(
                  fontWeight: FontWeight.w600
              ),
            ),
            new Text("aus Mullrose")
          ],
        )
      ],
    );
  }
}

