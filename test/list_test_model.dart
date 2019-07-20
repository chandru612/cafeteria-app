import 'package:flutter_test/flutter_test.dart';
import 'package:cafeteria/Models/foodItem.dart';
import 'package:mockito/mockito.dart';

class MockFoodItem extends Mock implements FoodItem {

}

main() {
  test('should check the list count', () {
    var mockFoodItem = MockFoodItem();
    when(mockFoodItem.name).thenReturn("juice");
    expect(mockFoodItem.name, "juice");
  });
}