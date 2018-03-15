import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_playground/github_service.dart';


class GitHubServiceContext extends InheritedWidget {

  final GitHubService gitHubService;

  GitHubServiceContext({
    Key key,
    @required this.gitHubService,
    @required Widget child
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(GitHubServiceContext oldWidget) {
    return oldWidget.gitHubService != gitHubService;
  }

  static GitHubServiceContext of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(GitHubServiceContext);
  }
}