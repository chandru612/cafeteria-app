import 'package:flutter_test/flutter_test.dart';
import 'package:cafeteria/models/food_item.dart';
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