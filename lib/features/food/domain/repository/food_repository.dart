import 'package:foodoptima/core/resources/data_state_local.dart';
import 'package:foodoptima/features/food/data/models/food.dart';

abstract class FoodRespository {
  // Insert a new alimento
  Future<DataState<int>> insert(FoodModel alimento);

  // Get all alimentos
  Future<DataState<List<FoodModel>>> getAll();

  // Get alimento by ID
  Future<DataState<FoodModel?>> getById(int id);

  // Update an alimento
  Future<DataState<int>> update(FoodModel alimento);

  // Delete an alimento by ID
  Future<DataState<int>> deleteById(int id);
}
