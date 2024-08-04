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
    await db.execute('''
       CREATE TABLE quotes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      text TEXT NOT NULL,
      author TEXT NOT NULL,
      cate TEXT NOT NULL,
      liked TEXT NOT NULL
    )
    ''');
  }

  Future<void> insertQuote(Database db, String cate, String text, String author, String liked) async {
    await db.rawInsert('''
    INSERT INTO quotes (cate, id, text, author, liked) VALUES (?, NULL, ?, ?, ?)
  ''', [cate, text, author, liked]);
  }

  Future<int> deleteQuote(String text) async {
    final db = await instance.database;
    return await db.delete('quotes', where: 'text = ?', whereArgs: [text]);
  }

  Future<List<Map<String, dynamic>>> getLikedQuotes() async {
    final db = await instance.database;
    return await db.query('quotes', where: 'liked = ?', whereArgs: [1]);
  }

  Future<List<Map<String, dynamic>>> getLikedcateQuotes(String cate) async {
    final db = await instance.database;
    return await db.query(
      'quotes',
      where: 'liked = ? AND category = ?',
      whereArgs: [1, cate],
    );
  }

}

