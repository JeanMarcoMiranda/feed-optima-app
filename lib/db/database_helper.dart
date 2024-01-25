import 'package:foodoptima/db/queries/tables.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = 'database.db';
  static const _databaseVersion = 1;
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._internal();

  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(createFoodTable);
    await db.execute(createBullRequirementsTable);
    await db.execute(createCowRequirementsTable);
    await db.execute(createRestrictionsTable);
    await db.execute(createListFoodTable);
    await db.execute(createFoodForFoodListTable);
  }
}
