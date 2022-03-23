part of 'example_bloc.dart';

class ExampleState extends Equatable {
  final List<UriCategory> examples;

  const ExampleState({
    this.examples = const <UriCategory>[],
  });

  ExampleState copyWith({
    List<UriCategory>? examples,
  }) {
    return ExampleState(
      examples: examples ?? this.examples,
    );
  }

  @override
  String toString() {
    return '''ExampleState { examples: ${examples.length} }''';
  }

  @override
  List<Object> get props => [examples];
}
