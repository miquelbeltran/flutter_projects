import 'package:flutter/material.dart';
import 'package:flutter_rss_reader/rss.dart';
import 'package:flutter_rss_reader/rss_feed_widget.dart';
import 'package:webfeed/webfeed.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text('Aktuelle Polizeimeldungen'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Berlin'),
                Tab(text: 'Brandenburg'),
              ],
            ),
          ),
          body: TabBarView(
              children: [
                RssFeedWidget(rssFuture: rssService.getRssBerlin()),
                RssFeedWidget(rssFuture: rssService.getRssBrandenburg()),
              ]
          ),
        ),
      ),
    );
  }
}
