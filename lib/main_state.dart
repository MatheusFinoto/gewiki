import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainState extends ChangeNotifier {
  final BuildContext context;

  MainState(this.context) {
    loadThemeMode();
  }

  ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode(ThemeMode mode) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String value = '';

    if (mode == ThemeMode.system) {
      value = 'S';
    }
    if (mode == ThemeMode.light) {
      value = 'L';
    }
    if (mode == ThemeMode.dark) {
      value = 'D';
    }

    await sp.setString(
      'ThemeMode',
      value,
    );

    themeMode = mode;

    notifyListeners();
  }

  void loadThemeMode() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? themeModeLocal = sp.getString('ThemeMode');

    if (themeModeLocal != null) {
      if (themeModeLocal == 'L') {
        themeMode = ThemeMode.light;
      }
      if (themeModeLocal == 'D') {
        themeMode = ThemeMode.dark;
      }
      if (themeModeLocal == 'S') {
        themeMode = ThemeMode.system;
      }
    }

    notifyListeners();
  }
}
