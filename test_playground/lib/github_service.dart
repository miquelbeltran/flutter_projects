import 'dart:async';
import 'dart:convert';
import 'dart:io';

const String baseUrl = "api.github.com";
const String getUsersUrl = "/users";

class GitHubService {
  HttpClient _httpClient = new HttpClient();

  Future<List<User>> getUsers(final int last) async {
    var request = await _httpClient.getUrl(_getUsersUri(last));
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    List<Map> json = JSON.decode(responseBody);
    return json.map(_mapGitHubToUser).toList();
  }

  Uri _getUsersUri(final int last) =>
      new Uri.https(baseUrl, "/users", { "since" : last.toString() });


  User _mapGitHubToUser(Map item) {
    return new User(
        item["login"],
        item["id"],
        item["avatar_url"],
        item["url"]
    );
  }
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


