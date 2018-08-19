import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';
import 'package:intl/intl.dart';

class RssFeedWidget extends StatefulWidget {
  final Future<RssFeed> rssFuture;

  RssFeedWidget({
    Key key,
    this.rssFuture,
  }) : super(key: key);

  @override
  _RssFeedState createState() => new _RssFeedState();
}

class _RssFeedState extends State<RssFeedWidget> {
  RssFeed rss;

  @override
  void initState() {
    super.initState();
    widget.rssFuture.then((rss) {
      setState(() {
        this.rss = rss;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
          top: 16.0,
          bottom: 8.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Row(
          children: <Widget>[
            buildDateText(),
            buildTitleText(context),
          ],
        ),
      ),
    );
  }

  Widget buildTitleText(BuildContext context) {
    return Flexible(
      child: Text(
        item.title,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.subhead,
      ),
    );
  }

  Widget buildDateText() {
    DateFormat format = new DateFormat("EEE, dd MMM yyyy hh:mm:ss Z");
    var date = format.parse(item.pubDate);
    var topFormat = DateFormat('EEEE');
    var midFormat = DateFormat('dd MMMM');
    var botFormat = DateFormat('HH:mm');
    var style = TextStyle(
      fontSize: 12.0,
      color: Colors.grey,
    );
    return Container(
      width: 72.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            topFormat.format(date),
            style: style,
          ),
          Text(
            midFormat.format(date),
            style: style,
          ),
          Text(
            botFormat.format(date),
            style: style,
          ),
        ],
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
