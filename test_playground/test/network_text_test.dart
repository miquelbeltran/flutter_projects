import 'package:flutter_test/flutter_test.dart';
import 'package:test_playground/github_service.dart';
import 'package:test_playground/network_text.dart';


class GitHubServiceMock implements GitHubService {

  @override
  Future<List<User>> getUsers(int last) {
    return new Future.value([new User(
      "username", 1, "", ""
    )]);
  }

}

void main() {
  testWidgets('NetworkText widget test by mocking the GitHubService', (WidgetTester tester) async {
    gitHubService = new GitHubServiceMock();

    await tester.pumpWidget(new NetworkText());
    expect(find.text('initial'), findsOneWidget);

    await tester.pump();
    expect(find.text('username'), findsOneWidget);

  });
}
