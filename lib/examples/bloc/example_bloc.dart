import 'dart:convert';

import 'package:Yuri/examples/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';

part 'example_event.dart';

part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  // TODO replace 🔥B with Generic API Client
  ExampleBloc(this.instance) : super(const ExampleState()) {
    on<ExampleInitialObserve>(_onInitialObserve);
    on<ExampleFetched>(_onExampleFetched);
  }

  final FirebaseDatabase instance;

  Future<void> _onInitialObserve(
      ExampleInitialObserve event, Emitter<ExampleState> emit) async {
    DatabaseReference ref = instance.ref();

    var exampleStream = ref.limitToFirst(2).onValue;

    await emit.forEach(exampleStream, onData: (DatabaseEvent event) {
      List<UriCategory> examples = deserializeExamples(event.snapshot);
      return state.copyWith(
        status: ExampleStatus.success,
        examples: examples,
        hasReachedMax: false,
      );
    });
  }

  Future<void> _onExampleFetched(
      ExampleFetched event, Emitter<ExampleState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == ExampleStatus.initial) {
        DatabaseReference ref = instance.ref();

        final snapshot = await ref.get();
        if (snapshot.exists) {
          List<UriCategory> examples = deserializeExamples(snapshot);

          return emit(state.copyWith(
            status: ExampleStatus.success,
            examples: examples,
            hasReachedMax: false,
          ));
        } else {
          return emit(state.copyWith(
            status: ExampleStatus.success,
            examples: [],
            hasReachedMax: true,
          ));
        }
      }
    } catch (_) {
      emit(state.copyWith(status: ExampleStatus.failure));
    }
  }

  List<UriCategory> deserializeExamples(DataSnapshot snapshot) {
    List json = jsonDecode(jsonEncode(snapshot.value));
    var examples = <UriCategory>[];
    json.forEach((element) {
      examples.add(UriCategory.fromJson(element));
    });
    return examples;
  }
}
