// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cafeteria/Component/FoodListComponent.dart';
import 'package:cafeteria/Models/FoodItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFoodList extends Mock implements List<FoodItem> {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    var mockFoodList = MockFoodList();

    when(mockFoodList.length).thenReturn(2);

    var foodListComponent = FoodListComponent(mockFoodList);
    await tester.pumpWidget(foodListComponent);

    Finder finder = find.byKey(ValueKey("food_list_builder"));

    ListView testWidget = finder.evaluate().single.widget;

    expect(testWidget, findsNothing);
  });
}
