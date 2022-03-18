part of 'example_bloc.dart';

enum ExampleStatus { initial, success, failure }

class ExampleState extends Equatable {
  final ExampleStatus status;
  final List<UriCategory> examples;
  final bool hasReachedMax;

  const ExampleState({
    this.status = ExampleStatus.initial,
    this.examples = const <UriCategory>[],
    this.hasReachedMax = false,
  });

  ExampleState copyWith({
    ExampleStatus? status,
    List<UriCategory>? examples,
    bool? hasReachedMax,
  }) {
    return ExampleState(
      status: status ?? this.status,
      examples: examples ?? this.examples,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ExampleState { status: $status, hasReachedMax: $hasReachedMax, examples: ${examples.length} }''';
  }

  @override
  List<Object> get props => [status, examples, hasReachedMax];
}
