import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'provider/theme_changer_provider.dart';
import 'Screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChangerProvider>(
      builder: (_) => ThemeChangerProvider(Brightness.light, Colors.green),
      child: new MaterialAppTheme(),
    );
  }
}

class MaterialAppTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);

    return new MaterialApp(
      title: 'Cafeteria',
      theme: ThemeData(
        primarySwatch: themeChangerProvider.appThemeColor,
        brightness: themeChangerProvider.brightness,
      ),
      home: LoginScreen(),
    );
  }
}
