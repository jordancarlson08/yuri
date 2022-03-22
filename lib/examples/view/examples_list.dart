import 'package:yuri/examples/widgets/list_item_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/example_bloc.dart';
import '../widgets/bottom_loader.dart';

class ExamplesList extends StatefulWidget {
  const ExamplesList({Key? key}) : super(key: key);

  @override
  State<ExamplesList> createState() => _ExamplesListState();
}

class _ExamplesListState extends State<ExamplesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

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
                return index >= state.examples.length
                    ? BottomLoader()
                    : ExampleListItem(category: state.examples[index]);
              },
              itemCount: state.examples.length,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ExampleBloc>().add(ExampleFetchNext());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
