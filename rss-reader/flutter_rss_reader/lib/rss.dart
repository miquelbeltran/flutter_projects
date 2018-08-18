
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:webfeed/webfeed.dart';

Future getRss() async {
  HttpClient http = new HttpClient();
  var uri = new Uri.https('www.berlin.de', '/polizei/polizeimeldungen/index.php/rss');
  var request = await http.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(UTF8.decoder).join();
  var rss = RssFeed.parse(responseBody);
  print(rss);
}
