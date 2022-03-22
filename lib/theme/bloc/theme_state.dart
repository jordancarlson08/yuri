part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState({required this.themeData}) : super();

  ThemeState copyWith({required ThemeData themeData}) {
    return ThemeAlternate(themeData: themeData);
  }

  @override
  List<Object> get props => [themeData];
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(themeData: greenLight);
}

class ThemeAlternate extends ThemeState {
  const ThemeAlternate({required ThemeData themeData})
      : super(themeData: themeData);
}
