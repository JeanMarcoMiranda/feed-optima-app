import 'package:foodoptima/core/resources/data_state_local.dart';
import 'package:foodoptima/core/usecases/usecase.dart';
import 'package:foodoptima/features/food/data/models/food.dart';
import 'package:foodoptima/features/food/domain/repository/food_repository.dart';

class GetFoodByIdUseCase implements UseCase<DataState<FoodModel?>, int> {
  final FoodRespository _foodRespository;

  GetFoodByIdUseCase(this._foodRespository);

  @override
  Future<DataState<FoodModel?>> call({int? params}) {
    return _foodRespository.getById(params!);
  }
}
