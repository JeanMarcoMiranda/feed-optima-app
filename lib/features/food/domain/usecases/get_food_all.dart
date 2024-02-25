import 'package:foodoptima/core/resources/data_state_local.dart';
import 'package:foodoptima/core/usecases/usecase.dart';
import 'package:foodoptima/features/food/domain/entities/food.dart';
import 'package:foodoptima/features/food/domain/repository/food_repository.dart';

class GetFoodAllUseCase implements UseCase<DataState<List<FoodEntity>>, void> {
  final FoodRespository _foodRespository;

  GetFoodAllUseCase(this._foodRespository);

  @override
  Future<DataState<List<FoodEntity>>> call({void params}) {
    return _foodRespository.getAll();
  }
}
