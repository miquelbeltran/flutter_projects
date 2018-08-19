
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:webfeed/webfeed.dart';

var rssService = RssService();

class RssService {

  RssFeed _rssBerlin;
  RssFeed _rssBrandenburg;

  Future<RssFeed> getRssBerlin() async {
    if (_rssBerlin == null) {
      _rssBerlin = await _getRssBerlin();
    }
    return _rssBerlin;
  }

  Future<RssFeed> getRssBrandenburg() async {
    if (_rssBrandenburg == null) {
      _rssBrandenburg = await _getRssBrandenburg();
    }
    return _rssBrandenburg;
  }

  var _uriBerlin = Uri.https('www.berlin.de', '/polizei/polizeimeldungen/index.php/rss');
  var _uriBrandenburg = Uri.https('polizei.brandenburg.de', '/pressemeldungen/rss/region/57581');

  Future<RssFeed> _getRss(Uri uri) async {
    HttpClient http = new HttpClient();
    var request = await http.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    var rss = RssFeed.parse(responseBody);
    return rss;
  }

  Future<RssFeed> _getRssBerlin() => _getRss(_uriBerlin);
  Future<RssFeed> _getRssBrandenburg() => _getRss(_uriBrandenburg);

}
