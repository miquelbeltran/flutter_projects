import 'package:flutter/material.dart';
import 'package:flutter_rss_reader/rss.dart';
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
      home: new MyHomePage(title: 'Aktuelle Polizeimeldungen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RssFeed rss;

  @override
  void initState() {
    super.initState();
    getRss().then((rss) {
      setState(() {
        this.rss = rss;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: _buildList(context));
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: rss?.items?.length ?? 0,
      itemBuilder: (context, int) {
        return new RssItemWidget(rss.items[int]);
      },
    );
  }
}

class RssItemWidget extends StatelessWidget {
  final RssItem item;

  RssItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                item.pubDate,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(item.link)) {
      await launch(item.link);
    } else {
      print('Could not launch ${item.link}');
    }
  }
}
