import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define theme states
abstract class ThemeState {}

class LightThemeState extends ThemeState {}

class DarkThemeState extends ThemeState {}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState()) {
    _loadSavedTheme();
  }

  // Load theme preference from SharedPreferences
  Future<void> _loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;

    if (isDarkMode) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  // Toggle between light and dark theme
  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (state is LightThemeState) {
      emit(DarkThemeState());
      await prefs.setBool('isDarkMode', true);
    } else {
      emit(LightThemeState());
      await prefs.setBool('isDarkMode', false);
    }
  }

  // Get current theme mode
  ThemeMode get themeMode =>
      state is DarkThemeState ? ThemeMode.dark : ThemeMode.light;

  // Check if dark mode is active
  bool get isDarkMode => state is DarkThemeState;
}
