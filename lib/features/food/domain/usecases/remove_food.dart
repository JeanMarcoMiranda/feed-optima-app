import 'package:foodoptima/core/resources/data_state_local.dart';
import 'package:foodoptima/core/usecases/usecase.dart';
import 'package:foodoptima/features/food/domain/repository/food_repository.dart';

class RemoveFoodUseCase implements UseCase<DataState<int>, int> {
  final FoodRespository _foodRespository;

  RemoveFoodUseCase(this._foodRespository);

  @override
  Future<DataState<int>> call({int? params}) {
    return _foodRespository.deleteById(params!);
  }
}
