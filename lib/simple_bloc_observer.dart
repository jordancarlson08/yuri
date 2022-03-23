import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

class SimpleBlocObserver extends BlocObserver {
  final log = Logger('SimpleBlocObserver');

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log.fine('onEvent: $bloc : $event');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log.fine('onCreate: $bloc');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log.fine('onTransition: $bloc : $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.severe("onError: $bloc", error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
