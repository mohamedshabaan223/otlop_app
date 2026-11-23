import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  ThemeMode selectedTheme = ThemeMode.light;
  String langCode = 'en';
  bool get isDark => selectedTheme == ThemeMode.dark;
  void changeTheme(ThemeMode theme) async {
    if (selectedTheme == theme) return;
    selectedTheme = theme;
    saveTheme(theme);
    emit(ThemeSuccessState(message: 'Theme Changed Successfully'));
  }

  Future<void> saveTheme(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', theme == ThemeMode.light ? 'light' : 'dart');
  }

  void getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'light';
    if (theme == 'light') {
      selectedTheme = ThemeMode.light;
    } else {
      selectedTheme = ThemeMode.dark;
    }
    emit(ThemeLoadingState());
  }
}
