import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'database.db';
  static final _databaseVersion = 1;
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
    await db.execute('''
      CREATE TABLE alimentos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        materia_seca DOUBLE,
        proteina_total DOUBLE,
        energia_neta_g DOUBLE,
        energia_metab DOUBLE,
        ndt DOUBLE,
        calcio DOUBLE,
        fosforo DOUBLE,
        fibra_cruda DOUBLE,
        fdn DOUBLE,
        vit_a DOUBLE,
        vit_d DOUBLE
      );

    CREATE TABLE requerimientosToros (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        peso_vivo TEXT,
        energia_metab DOUBLE,
        fibra_cruda DOUBLE,
        calcio DOUBLE,
        fosforo DOUBLE,
        vit_a DOUBLE,
        vit_d DOUBLE,
        proteina DOUBLE,
        ms DOUBLE,
        numero INTEGER,
        raza TEXT
    );

    CREATE TABLE requerimientosVacas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        peso_vivo TEXT,
        energia_metab DOUBLE,
        fibra_cruda DOUBLE,
        calcio DOUBLE,
        fosforo DOUBLE,
        vit_a DOUBLE,
        vit_d DOUBLE,
    );

    CREATE TABLE restricciones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        alimento TEXT,
        restriccion TEXT,
    ''');
  }
}
