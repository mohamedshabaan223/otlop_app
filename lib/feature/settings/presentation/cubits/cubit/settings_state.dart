part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ThemeLoadingState extends SettingsState {}

class ThemeSuccessState extends SettingsState {
  final String message;
  ThemeSuccessState({required this.message});
}

class LangaugeLoadingState extends SettingsState {}

class LangaugeSuccessState extends SettingsState {
  final String message;
  LangaugeSuccessState({required this.message});
}
