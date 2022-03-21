part of 'example_bloc.dart';

abstract class ExampleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ExampleFetchNext extends ExampleEvent {}
class ExampleInitialObserve extends ExampleEvent {}
