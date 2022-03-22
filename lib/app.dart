import 'package:Yuri/examples/view/examples_page.dart';
import 'package:Yuri/theme/bloc/theme_bloc.dart';
import 'package:Yuri/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: _buildWithTheme),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    print("${state.themeData}");
    return MaterialApp(
      title: 'Yuri',
      theme: state.themeData,
      home: const ExamplesPage(),
    );
  }
}
