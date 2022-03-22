import 'dart:async';

import 'package:yuri/examples/data/example_data_provider.dart';
import 'package:yuri/examples/models/models.dart';

class ExampleRepository {
  final ExampleDataProvider _dataProvider;

  ExampleRepository(this._dataProvider);

  Stream<List<UriCategory>> getInitialUriCategories(int count) {
    return _dataProvider.getInitial(count);
  }

  Future<List<UriCategory>> getNextPage(int startAt, int count) {
    return _dataProvider.getNextPage(startAt, count);
  }
}
