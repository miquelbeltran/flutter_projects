import 'package:flutter/material.dart';
import 'package:post_app/post_value.dart';
import 'package:post_app/post_widget.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

const _posts = const <Post>[
  const Post(
      title: "Roof party vaporware post-ironic",
      body: "Fingerstache +1 farm-to-table, green juice hot chicken fam tbh franzen narwhal vice listicle hell of offal flannel. Ramps readymade asymmetrical leggings. Butcher adaptogen vape, kitsch prism organic jianbing shabby chic austin four loko VHS synth tousled. Four dollar toast sartorial schlitz meh heirloom, salvia normcore photo booth.",
      author: "Distillery cold-pressed"
  ),
  const Post(
      title: "vaporware vape enamel pin",
      body: "Fam slow-carb pop-up aesthetic organic next level post-ironic cold-pressed tumeric messenger bag banjo viral stumptown. Art party banh mi kitsch, vegan pop-up godard farm-to-table master cleanse messenger bag typewriter. Kinfolk venmo four dollar toast, art party occupy vegan williamsburg photo booth intelligentsia try-hard hell of etsy edison bulb. Iceland polaroid ramps portland banjo wolf. Seitan lo-fi art party, vape shaman vegan heirloom schlitz iPhone jianbing vaporware fam.",
      author: "Pour-over slow-carb iPhone celiac"
  )
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

var _white1 = new Color(0xFFEDEDE9);

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
          itemBuilder: (context, index) => new PostWidget(_posts[index]),
          itemCount: _posts.length,
          padding: new EdgeInsets.symmetric(vertical: 8.0)
      ),

    );
  }
}

