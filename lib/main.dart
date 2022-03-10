import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'firebase_options.dart';

part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  var uriCategories = <UriCategory>[];

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    ref.onValue.listen((event) {
      List json = jsonDecode(jsonEncode(event.snapshot.value));
      var list = <UriCategory>[];
      json.forEach((element) {
        list.add(UriCategory.fromJson(element));
      });

      setState(() {
        uriCategories = list;
      });
    });

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
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: getUriWidgets(context, uriCategories),
                ),
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
        style: TextStyle(
            color: beigeAlt, fontSize: 13, fontWeight: FontWeight.bold),
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
                    await launch(uri.uri);
                  }),
            TextSpan(
                style: TextStyle(
                    color: tealAlt,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
                text: uri.uri,
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launch(uri.uri);
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

@JsonSerializable()
class UriCategory {
  String name = "";
  List<UriExample> uris = <UriExample>[];

  UriCategory(this.name, this.uris);

  factory UriCategory.fromJson(Map<String, dynamic> json) =>
      _$UriCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$UriCategoryToJson(this);
}

@JsonSerializable()
class UriExample {
  String label;
  String uri;

  UriExample(this.label, this.uri);

  factory UriExample.fromJson(Map<String, dynamic> json) =>
      _$UriExampleFromJson(json);

  Map<String, dynamic> toJson() => _$UriExampleToJson(this);
}
