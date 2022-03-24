import 'package:yuri/examples/bloc/example_bloc.dart';
import 'package:yuri/examples/data/example_repository.dart';
import 'package:yuri/rooms/views/create_room_bottom_sheet.dart';
import 'package:yuri/theme/bloc/theme_bloc.dart';
import 'package:yuri/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/example_data_provider.dart';
import 'examples_list.dart';

var currentThemeOrdinal = 1;

class ExamplesPage extends StatelessWidget {
  ExamplesPage({Key? key}) : super(key: key);

  final ExampleRepository repo =
      ExampleRepository(FirebaseExampleDataProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
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
                          style: Theme.of(context).textTheme.headline3,
                          // style: TextStyle(
                          //     color: Theme.of(context).primaryColor,
                          //     fontSize: 24,
                          //     fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: ElevatedButton(
                            onPressed: () => {_buttonPressed(context)},
                            child: const Text("Next theme")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: ElevatedButton(
                            onPressed: () =>
                                {showCreateRoomBottomSheet(context)},
                            child: const Text("Show bottom sheet")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocProvider(
                create: (_) => ExampleBloc(repo)..add(ExampleInitialObserve()),
                child: const ExamplesList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  tryThis() {}

  newMethod(BuildContext context) => _buttonPressed(context);

  _buttonPressed(BuildContext context) {
    var nextTheme = AppTheme.values[currentThemeOrdinal];
    if (currentThemeOrdinal < 3) {
      currentThemeOrdinal++;
    } else {
      currentThemeOrdinal = 0;
    }
    context.read<ThemeBloc>().add(ThemeChanged(theme: nextTheme));
  }
}
