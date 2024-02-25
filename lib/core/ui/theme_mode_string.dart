import 'package:flutter/material.dart';

// Constantes para los modos de tema
const themeModeDark = "dark";
const themeModeLight = "light";
const themeModeSystem = "system";

// Extensión para convertir una cadena a ThemeMode
extension StringThemeModeExtension on String {
  ThemeMode toThemeMode() {
    switch (this) {
      case themeModeDark:
        return ThemeMode.dark;
      case themeModeLight:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}

// Extensión para convertir ThemeMode a una cadena para caché
extension ThemeModeStringExtension on ThemeMode {
  String toCacheString() {
    switch (this) {
      case ThemeMode.dark:
        return themeModeDark;
      case ThemeMode.light:
        return themeModeLight;
      default:
        return themeModeSystem;
    }
  }
}
