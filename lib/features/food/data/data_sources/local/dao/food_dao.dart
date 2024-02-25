import 'package:foodoptima/core/database/constants/table_constants.dart';
import 'package:foodoptima/core/database/migrations/init_database.dart';
import 'package:foodoptima/core/resources/data_state_local.dart';
import 'package:foodoptima/features/food/data/models/food.dart';
import 'package:sqflite/sqflite.dart';

class FoodDao {
  Future<DataState<int>> insert(FoodModel data) async {
    try {
      final db = await DatabaseHelper().database;
      final id = await db.insert(
          Tables.food, data.toMap()); // Insert and get the new ID
      return DataSuccess<int>(id); // Return success with the new ID
    } on DatabaseException catch (error) {
      return DataFailed<int>(error); // Return failure with error object
    }
  }

  Future<DataState<List<FoodModel>>> getAll() async {
    try {
      final db = await DatabaseHelper().database;
      List<Map<String, dynamic>> data = await db.query(Tables.food);
      final foodList = data
          .map((e) => const FoodModel().fromMap(e))
          .toList(); // Create FoodModel list
      return DataSuccess<List<FoodModel>>(
          foodList); // Return success with FoodModel list
    } on DatabaseException catch (error) {
      return DataFailed<List<FoodModel>>(
          error); // Return failure with error object
    }
  }

  Future<DataState<FoodModel?>> getById(int id) async {
    try {
      final db = await DatabaseHelper().database;
      List<Map<String, dynamic>> data = await db.query(
        Tables.food,
        where: '${FoodFields.id} = ?',
        whereArgs: [id],
      );
      final food = data.isEmpty
          ? null
          : const FoodModel().fromMap(data.first); // Create FoodEntity from map
      return DataSuccess<FoodModel?>(
          food); // Return success with FoodEntity or null
    } on DatabaseException catch (error) {
      return DataFailed<FoodModel?>(error); // Return failure with error object
    }
  }

  Future<DataState<int>> update(FoodModel data) async {
    try {
      final db = await DatabaseHelper().database;
      final rowsUpdated = await db.update(
        Tables.food,
        data.toMap(),
        where: '${FoodFields.id} = ?',
        whereArgs: [data.id],
      );
      return DataSuccess<int>(
          rowsUpdated); // Return success with rows updated count
    } on DatabaseException catch (error) {
      return DataFailed<int>(error); // Return failure with error object
    }
  }

  Future<DataState<int>> delete(int id) async {
    try {
      final db = await DatabaseHelper().database;
      final rowsDeleted = await db.delete(
        Tables.food,
        where: '${FoodFields.id} = ?',
        whereArgs: [id],
      );
      return DataSuccess<int>(
          rowsDeleted); // Return success with rows deleted count
    } on DatabaseException catch (error) {
      return DataFailed<int>(error); // Return failure with error object
    }
  }
}
