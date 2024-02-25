import 'package:foodoptima/core/resources/data_state_local.dart';
import 'package:foodoptima/features/food/data/models/food.dart';
import 'package:foodoptima/features/food/domain/repository/food_repository.dart';

import '../data_sources/local/dao/food_dao.dart';

class FoodRepositoryImpl extends FoodRespository {
  FoodDao dao = FoodDao();

  FoodRepositoryImpl(this.dao);

  @override
  Future<DataState<int>> insert(FoodModel food) async {
    return dao.insert(food);
  }

  @override
  Future<DataState<List<FoodModel>>> getAll() {
    return dao.getAll();
  }

  @override
  Future<DataState<FoodModel?>> getById(int id) {
    return dao.getById(id);
  }

  @override
  Future<DataState<int>> update(FoodModel food) {
    return dao.update(food);
  }

  @override
  Future<DataState<int>> deleteById(int id) {
    return dao.delete(id);
  }
}
