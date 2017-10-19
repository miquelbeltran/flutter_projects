import 'package:flutter/material.dart';
import 'package:flutter_github_users/userlist/userlist_page.dart';

const int _black = 0xFF24292e;
const int _dark = 0xFF2b3137;
const int _white = 0xFFfafbfc;
const int _blue = 0xFF01579B;

class GitHubUsersApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GitHub Users',
      theme: new ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: const Color(_black),
        secondaryHeaderColor: const Color(_dark),
        backgroundColor: const Color(_white),
        accentColor: const Color(_blue),
      ),
      home: new UserListPage(title: 'GitHub Users List'),
    );
  }
}
