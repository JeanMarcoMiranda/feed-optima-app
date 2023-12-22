import 'package:foodoptima/db/database_helper.dart';
import 'package:foodoptima/models/requirement_model.dart';
import 'package:sqflite/sqflite.dart';

class CowRequirementsDao {
  final dbHelper = DatabaseHelper.instance.database;

  // Insert a new alimento
  Future<int> insert(CowRequirementsModel data) async {
    Database db = await dbHelper;
    return await db.insert('requerimientosVacas', data.toMap());
  }

  // Get all alimentos
  Future<List<CowRequirementsModel>> getAll() async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query('requerimientosVacas');
    return data.map((e) => CowRequirementsModel.fromJson(e)).toList();
  }

  // Get alimento by ID
  Future<CowRequirementsModel?> getById(int id) async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query(
      'requerimientosVacas',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data.isEmpty ? null : CowRequirementsModel.fromJson(data.first);
  }

  // Update an alimento
  Future<int> update(CowRequirementsModel data) async {
    Database db = await dbHelper;
    return await db.update(
      'requerimientosVacas',
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  // Delete an alimento by ID
  Future<int> delete(int id) async {
    Database db = await dbHelper;
    return await db.delete(
      'requerimientosVacas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class BullRequirementsDao {
  final dbHelper = DatabaseHelper.instance.database;

  // Insert a new alimento
  Future<int> insert(BullRequirementsModel data) async {
    Database db = await dbHelper;
    return await db.insert('requerimientosToros', data.toMap());
  }

  // Get all alimentos
  Future<List<BullRequirementsModel>> getAll() async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query('requerimientosToros');
    return data.map((e) => BullRequirementsModel.fromJson(e)).toList();
  }

  // Get alimento by ID
  Future<BullRequirementsModel?> getById(int id) async {
    Database db = await dbHelper;
    List<Map<String, dynamic>> data = await db.query(
      'requerimientosToros',
      where: 'id = ?',
      whereArgs: [id],
    );
    return data.isEmpty ? null : BullRequirementsModel.fromJson(data.first);
  }

  // Update an alimento
  Future<int> update(BullRequirementsModel data) async {
    Database db = await dbHelper;
    return await db.update(
      'requerimientosToros',
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  // Delete an alimento by ID
  Future<int> delete(int id) async {
    Database db = await dbHelper;
    return await db.delete(
      'requerimientosToros',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
