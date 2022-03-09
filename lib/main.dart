import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Yuri'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<UriExample> accessories = [
      UriExample("Accessories Home", "chatbooks://accessories"),
      UriExample(
          "Accessories Specific SKU", "chatbooks://accessories?sku=SOP101"),
    ];
    List<UriExample> duplos = [
      UriExample("Duplo HC MB Explainer",
          "chatbooks://duploexplainer?product=hardcovermonthbooks"),
      UriExample("Duplo SC MB Explainer",
          "chatbooks://duploexplainer?product=monthbooks")
    ];
    List<UriCategory> categories = [
      UriCategory("ACCESSORIES", accessories),
      UriCategory("DUPLOS", duplos),
    ];

    var darkGreen = const Color(0xFF024A4F);
    var background = const Color(0xFFF9F4F0);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/ic_yuri.png',
                    height: 32,
                    width: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      "Yuri",
                      style: TextStyle(
                          color: darkGreen,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: getUriWidgets(context, categories),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> getUriWidgets(BuildContext context, List<UriCategory> categories) {
  var beigeAlt = const Color(0xFFE0B49E);
  var beige = const Color(0xFFF2DFD2);
  var tealAlt = const Color(0xFF21AA8E);
  var darkGreen = const Color(0xFF024A4F);

  var widgets = <Widget>[];
  for (var category in categories) {
    widgets.add(Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Text(
        category.name,
        style:
            TextStyle(color: beigeAlt, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    ));
    category.uris.asMap().forEach((index, uri) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(bottom: 16, top: 16),
        child: RichText(
            text: TextSpan(
          children: [
            TextSpan(
                style: TextStyle(
                    color: darkGreen,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                text: uri.label + "\n",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launch(uri.link);
                  }),
            TextSpan(
                style: TextStyle(
                    color: tealAlt,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
                text: uri.link,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launch(uri.link);
                  }),
          ],
        )),
      ));
      if (index + 1 < category.uris.length) {
        widgets.add(Divider(
          thickness: 1,
          color: beige,
        ));
      }
    });
  }
  return widgets;
}

class UriCategory {
  String name;
  List<UriExample> uris;

  UriCategory(this.name, this.uris);
}

class UriExample {
  String label;
  String link;

  UriExample(this.label, this.link);
}
