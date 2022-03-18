import 'package:Yuri/examples/view/examples_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yuri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplesPage(),
    );
  }
}
