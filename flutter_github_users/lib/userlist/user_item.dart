import 'package:flutter/material.dart';
import 'package:flutter_github_users/github/github_service.dart';
import 'package:flutter_github_users/userlist/useritem_page.dart';

class UserItem extends StatelessWidget {
  final User _user;

  UserItem(this._user);

  @override
  Widget build(BuildContext context) {
    var circleAvatar = new CircleAvatar(
      backgroundImage: new NetworkImage(_user.avatarUrl),
    );
    var avatarContainer = new Padding(
      padding:
          new EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      child: circleAvatar,
    );
    var title = new Text(
      _user.username,
      style: new TextStyle(fontSize: 16.0),
    );
    var titleContainer = new Center(
      child: title,
    );
    var row = new Row(
      children: [
        avatarContainer,
        titleContainer,
      ],
    );
    return new GestureDetector(
      onTap: () {
        _onTap(context);
      },
      child: row,
    );
  }

  void _onTap(BuildContext context) {
    Navigator
        .of(context)
        .push(new MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new UserItemPage(_user);
    }));
  }
}
