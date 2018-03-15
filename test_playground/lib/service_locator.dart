import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_playground/github_service.dart';


class ServiceLocator extends InheritedWidget {

  final GitHubService gitHubService;

  ServiceLocator({
    Key key,
    @required this.gitHubService,
    @required Widget child
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ServiceLocator oldWidget) {
    return oldWidget.gitHubService != gitHubService;
  }

  static ServiceLocator of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ServiceLocator);
  }
}