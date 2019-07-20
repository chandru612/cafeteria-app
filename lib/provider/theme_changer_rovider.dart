import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  Brightness _brightness;

  ThemeChangerProvider(this._brightness);

  Brightness get brightness => _brightness;

  setTheme(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  }
}
