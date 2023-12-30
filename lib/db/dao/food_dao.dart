import 'package:foodoptima/db/database_helper.dart';
import 'package:foodoptima/models/food_model.dart';
import 'package:sqflite/sqflite.dart';

class FoodDao {
  final dbHelper = DatabaseHelper.instance.database;

  // Insert a new alimento
  Future<int> insert(FoodModel data) async {
    Database db = await dbHelper;
    return await db.insert('alimentos', data.toMap());
  }

  // Get all alimentos
  Future<List<FoodModel>> getAll() async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query('alimentos');
    return data.map((e) => FoodModel.fromJson(e)).toList();
  }

  // Get alimento by ID
  Future<FoodModel?> getById(int id) async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query(
      'alimentos',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data.isEmpty ? null : FoodModel.fromJson(data.first);
  }

  // Update an alimento
  Future<int> update(FoodModel data) async {
    Database db = await dbHelper;
    return await db.update(
      'alimentos',
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  // Delete an alimento by ID
  Future<int> delete(int id) async {
    Database db = await dbHelper;
    return await db.delete(
      'alimentos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> isEmpty(String tabla) async {
    Database db = await dbHelper;
    final count = await db.query(tabla).then((results) => results.length);
    // Si el número de registros es 0, la tabla está vacía
    return count == 0;
  }
}
