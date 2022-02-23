import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../app_themes.dart';
import './theme.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    return super.initialState ??
        ThemeState(themeData: appThemeData[AppTheme.Normal]);
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: appThemeData[event.theme]);
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    print(json);
    try {
      return ThemeState(themeData: _mapNameToTheme(json['ThemeData']));
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return {'ThemeData': _mapThemeToName(state.themeData)};
  }

  ThemeData _mapNameToTheme(String name) {
    switch (name) {
      case '1':
        return appThemeData[AppTheme.Normal];
      case '2':
        return appThemeData[AppTheme.Dark];
      default:
        return appThemeData[AppTheme.Normal];
    }
  }

  String _mapThemeToName(ThemeData themeData) {
    if (themeData == appThemeData[AppTheme.Normal]) {
      return '1';
    } else {
      return '2';
    }
  }
}
