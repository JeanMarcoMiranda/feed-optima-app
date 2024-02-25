import 'package:foodoptima/core/resources/data_state_local.dart';
import 'package:foodoptima/core/usecases/usecase.dart';
import 'package:foodoptima/features/food/data/models/food.dart';
import 'package:foodoptima/features/food/domain/repository/food_repository.dart';

class UpdateFoodUseCase implements UseCase<DataState<int>, FoodModel> {
  final FoodRespository _foodRepository;

  UpdateFoodUseCase(this._foodRepository);

  @override
  Future<DataState<int>> call({FoodModel? params}) {
    return _foodRepository.update(params!);
  }
}
