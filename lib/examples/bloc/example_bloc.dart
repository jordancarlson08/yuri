import 'package:Yuri/examples/data/example_repository.dart';
import 'package:Yuri/examples/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'example_event.dart';

part 'example_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc(this.repo) : super(const ExampleState()) {
    on<ExampleInitialObserve>(_onInitialObserve);
    on<ExampleFetchNext>(_onExampleFetchNext,
        transformer: throttleDroppable(throttleDuration));
  }

  final ExampleRepository repo;

  Future<void> _onInitialObserve(
      ExampleInitialObserve event, Emitter<ExampleState> emit) async {
    var exampleStream = repo.getInitialUriCategories(3);

    await emit.forEach(exampleStream, onData: (List<UriCategory> categories) {
      return state.copyWith(
        status: ExampleStatus.success,
        examples: categories,
        hasReachedMax: false,
      );
    });
  }

  Future<void> _onExampleFetchNext(
      ExampleFetchNext event, Emitter<ExampleState> emit) async {
    print("onExampleFetchNext");
    if (state.hasReachedMax) return;
    try {
      final categories = await repo.getNextPage(state.examples.length, 2);

      return emit(state.copyWith(
        status: ExampleStatus.success,
        examples: List.of(state.examples)..addAll(categories),
        hasReachedMax: false,
      ));
    } catch (_) {
      emit(state.copyWith(status: ExampleStatus.failure));
    }
  }
}
