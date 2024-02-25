import 'package:foodoptima/core/database/migrations/create_tables.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'database.db';
  static const _databaseVersion = 1;

  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance ??= DatabaseHelper._internal();
  }

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<bool> isEmpty(String table) async {
    Database db = await database;
    final count = await db.query(table).then((results) => results.length);
    return count == 0;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    batch.execute(createFoodTable());
    batch.execute(createCowRequirementsTable());
    batch.execute(createBullRequirementsTable());
    batch.execute(createRestrictionsTable());
    batch.execute(createListFoodTable());
    batch.execute(createFoodForFoodListTable());
    await batch.commit();
  }
}
