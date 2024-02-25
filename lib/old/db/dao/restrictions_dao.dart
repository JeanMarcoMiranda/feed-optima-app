import 'package:foodoptima/db/database_helper.dart';
import 'package:foodoptima/models/restriction_model.dart';
import 'package:sqflite/sqflite.dart';

class RestrictionsDao {
  final dbHelper = DatabaseHelper.instance.database;

  // Insert a new alimento
  Future<int> insert(RestrictionModel data) async {
    Database db = await dbHelper;
    return await db.insert('restricciones', data.toMap());
  }

  // Get all alimentos
  Future<List<RestrictionModel>> getAll() async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query('restricciones');
    return data.map((e) => RestrictionModel.fromJson(e)).toList();
  }

  // Get alimento by ID
  Future<RestrictionModel?> getById(int id) async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query(
      'restricciones',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data.isEmpty ? null : RestrictionModel.fromJson(data.first);
  }

  // Update an alimento
  Future<int> update(RestrictionModel data) async {
    Database db = await dbHelper;
    return await db.update(
      'restricciones',
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  // Delete an alimento by ID
  Future<int> delete(int id) async {
    Database db = await dbHelper;
    return await db.delete(
      'restricciones',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
