import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  Brightness _brightness;
  MaterialColor _appThemeColor;

  ThemeChangerProvider(this._brightness, this._appThemeColor);

  Brightness get brightness => _brightness;

  MaterialColor get appThemeColor => _appThemeColor;

  setAppThemeColor(MaterialColor color) {
    _appThemeColor = color;
    notifyListeners();
  }

  setTheme(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  }
}
