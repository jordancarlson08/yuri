import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../models/models.dart';

abstract class ExampleDataProvider {
  Stream<List<UriCategory>> getInitial(int count);

  Future<List<UriCategory>> getNextPage(int startAt, int count);
}

class FirebaseExampleDataProvider implements ExampleDataProvider {
  //TODO: How should we actually access this? Is this ok? doesn't feel great
  FirebaseDatabase db = FirebaseDatabase.instance;

  @override
  Stream<List<UriCategory>> getInitial(int count) {
    Stream<DatabaseEvent> firstTwo = db.ref().limitToFirst(count).onValue;
    return firstTwo.map<List<UriCategory>>((e) {
      return deserializeExamples(e.snapshot);
    });
  }

  @override
  Future<List<UriCategory>> getNextPage(int startAt, int count) async {
    DataSnapshot snapshot =
        // await db.ref().startAt(startAt).endAt(startAt + count).get();
        await db.ref().orderByKey().startAt("9").get();
    return deserializeExamples(snapshot);
  }

  List<UriCategory> deserializeExamples(DataSnapshot snapshot) {
    if (snapshot.value != null) {
      List json = jsonDecode(jsonEncode(snapshot.value));
      var examples = <UriCategory>[];
      for (var element in json) {
        examples.add(UriCategory.fromJson(element));
      }
      return examples;
    } else {
      return [];
    }
  }
}

class RestExampleDataProvider implements ExampleDataProvider {
  @override
  Stream<List<UriCategory>> getInitial(int count) {
    throw UnimplementedError();
  }

  @override
  Future<List<UriCategory>> getNextPage(int startAt, int count) {
    throw UnimplementedError();
  }
}
