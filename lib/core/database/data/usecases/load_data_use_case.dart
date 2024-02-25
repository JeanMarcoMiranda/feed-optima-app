import 'package:foodoptima/core/resources/data_state_local.dart';
import 'package:foodoptima/core/usecases/usecase.dart';
import 'package:sqflite/sqflite.dart';

import '../repositories/data_repository.dart';

class DataLoadingUseCase implements UseCase<DataState<void>, void> {
  final DataRepository _repository;

  DataLoadingUseCase(this._repository);

  @override
  Future<DataState<void>> call({void params}) async {
    try {
      await _repository.uploadDataIfEmpty();
      return const DataSuccess<void>(null);
    } catch (error) {
      return DataFailed<void>(error as DatabaseException);
    }
  }
}
