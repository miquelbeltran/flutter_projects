import 'package:flutter/material.dart';
import 'package:flutter_github_users/github/github_service.dart';


class UserItemPage extends StatelessWidget {
  final User _user;
  UserItemPage(this._user);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${_user.username} Profile"),
      ),
      body: new Center(
        child: new Text(_user.username),
      ),
    );
  }
}
