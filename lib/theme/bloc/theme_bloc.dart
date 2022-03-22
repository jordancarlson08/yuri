import 'package:yuri/theme/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeChanged>(_onThemeChanged);
  }

  _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    return emit(
        state.copyWith(themeData: appThemeData[event.theme] ?? greenLight));
  }
}
