import 'package:logging/logging.dart';
import 'package:yuri/examples/data/example_repository.dart';
import 'package:yuri/examples/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'example_event.dart';

part 'example_state.dart';

const throttleDuration = Duration(milliseconds: 100);
final log = Logger("ExampleBloc");

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  List<UriCategory> categories = [];

  ExampleBloc(this.repo) : super(const ExampleState()) {
    on<ExampleInitialObserve>(_onInitialObserve);
    on<ExampleFetchNext>(_onExampleFetchNext,
        transformer: throttleDroppable(throttleDuration));
  }

  final ExampleRepository repo;

  Future<void> _onInitialObserve(
      ExampleInitialObserve event, Emitter<ExampleState> emit) async {
    log.fine("_onInitialObserve");

    var exampleStream = repo.getInitialUriCategories(3);

    await emit.forEach(exampleStream, onData: (List<UriCategory> categories) {
      this.categories.addAll(categories);
      return state.copyWith(
        examples: categories,
      );
    });
  }

  Future<void> _onExampleFetchNext(
      ExampleFetchNext event, Emitter<ExampleState> emit) async {
    log.fine("_onExampleFetchNext: $categories");
    try {
      final cats = await repo.getNextPage(categories.length, 2);
      categories.addAll(cats);

      return emit(state.copyWith(examples: categories));
    } catch (_) {
      emit(state.copyWith(examples: categories));
    }
  }
}
