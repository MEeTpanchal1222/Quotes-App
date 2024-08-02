// helpers/database_helper.dart
import 'package:pr_7_db_miner/modals/quote.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'quotes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE liked_quotes(id INTEGER PRIMARY KEY, text TEXT, author TEXT, cate TEXT, liked INTEGER)',
    );
  }

  Future<void> insertQuote(Quote quote) async {
    final db = await database;
    await db.insert(
      'liked_quotes',
      quote.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteQuote(int id) async {
    final db = await database;
    await db.delete(
      'liked_quotes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Quote>> getLikedQuotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('liked_quotes');

    return List.generate(maps.length, (i) {
      return Quote(
        id: maps[i]['id'],
        text: maps[i]['quote'],
        author: maps[i]['author'],
        category: maps[i]['cate'],
        liked: maps[i]['liked'] == 1,
      );
    });
  }
}
