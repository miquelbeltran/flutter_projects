
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_github_users/github/github_service.dart';
import 'package:flutter_github_users/userlist/user_item.dart';

class UserListPage extends StatefulWidget {

  UserListPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _UserListPageState createState() => new _UserListPageState();


}

class _UserListPageState extends State<UserListPage> {
  List<User> _users = [];

  void _addUsers(List<User> value) {
    setState(() {
      _users.addAll(value);
    });
  }

  void _loadMore() {
    getUsers(_users.last.id).then((users) {
      _addUsers(users);
    });
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = new Completer();
    _users = [];
    getUsers(0).then((users) {
      _addUsers(users);
      completer.complete();
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {

    var _listViewBuilder = new ListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: _users.length,
      itemExtent: 56.0,
    );

    var _refreshIndicator = new RefreshIndicator(
        child: _listViewBuilder,
        onRefresh: _onRefresh,
    );

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: _refreshIndicator,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index >= _users.length - 5) {
      _loadMore();
    }
    return new UserItem(_users[index]);
  }
}
