import 'package:Yuri/examples/bloc/example_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'examples_list.dart';

class ExamplesPage extends StatelessWidget {
  const ExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var darkGreen = const Color(0xFF024A4F);
    var background = const Color(0xFFF9F4F0);

    FirebaseDatabase db = FirebaseDatabase.instance;

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
                child: BlocProvider(
                  create: (_) => ExampleBloc(db)..add(ExampleInitialObserve()),
                  child: ExamplesList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
