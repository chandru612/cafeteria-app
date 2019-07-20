import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafeteria/Screens/FoodItemScreen.dart';
import 'Screens/FoodItemFeedbackScreen.dart';
import 'provider/ThemeChangerProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChangerProvider>(
      builder: (_) => ThemeChangerProvider(Brightness.light),
      child: new MaterialAppTheme(),
    );
  }
}

class MaterialAppTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: themeChangerProvider.brightness,
      ),
      home: FoodItemFeedbackScreen(),
    );
  }
}
