import 'package:Yuri/examples/widgets/list_item_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/example_bloc.dart';

class ExamplesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleBloc, ExampleState>(
      builder: (context, state) {
        switch (state.status) {
          case ExampleStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case ExampleStatus.success:
            if (state.examples.isEmpty) {
              return const Center(child: Text('no examples'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ExampleListItem(category: state.examples[index]);
              },
              itemCount:state.examples.length,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
