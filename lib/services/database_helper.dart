// lib/services/database_helper.dart
import 'package:pr_7_db_miner/modals/quote.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('quotes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
    CREATE TABLE quotes (
      id $idType,
      quote $textType,
      author $textType,
      category $textType,
      isFavorite $boolType
    )
    ''');
  }
  Future<Quote> insert(Quote quote) async {
    final db = await instance.database;
    final id = await db.insert('quotes', quote.toMap());
    return quote.copy(id: id);
  }

  Future<List<Quote>> getQuotes() async {
    final db = await instance.database;
    final result = await db.query('quotes');
    return result.map((json) => Quote.fromMap(json)).toList();
  }

  Future<int> update(Quote quote) async {
    final db = await instance.database;
    return db.update(
      'quotes',
      quote.toMap(),
      where: 'id = ?',
      whereArgs: [quote.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'quotes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
