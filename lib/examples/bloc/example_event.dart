part of 'example_bloc.dart';

abstract class ExampleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ExampleFetched extends ExampleEvent {}
class ExampleInitialObserve extends ExampleEvent {}
