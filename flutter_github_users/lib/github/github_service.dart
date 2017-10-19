import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

var httpClient = createHttpClient();
const String baseUrl = "https://api.github.com";
const String getUsersUrl = "/users";

Future<List<User>> getUsers(final int last) async {
  var result = await httpClient.get("$baseUrl$getUsersUrl?since=$last");
  List<Map> json = JSON.decode(result.body);
  return json.map(_mapGitHubToUser).toList();
}

User _mapGitHubToUser(Map item) {
  return new User(
    item["login"],
    item["id"],
    item["avatar_url"],
    item["url"]
  );
}

class User {
  String username;
  int id;
  String avatarUrl;
  String profileUrl;
  User(
      this.username,
      this.id,
      this.avatarUrl,
      this.profileUrl,
      );
}

