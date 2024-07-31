// lib/services/database_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../modals/quote.dart';

class DatabaseHelper {
  static final _databaseName = "quotes.db";
  static final _databaseVersion = 1;

  static final table = 'quotes';

  static final columnId = 'id';
  static final columnQuote = 'quote';
  static final columnAuthor = 'author';
  static final columnCategory = 'category';
  static final columnIsFavorite = 'isFavorite';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnQuote TEXT NOT NULL,
            $columnAuthor TEXT NOT NULL,
            $columnCategory TEXT NOT NULL,
            $columnIsFavorite INTEGER NOT NULL DEFAULT 0
          )
          ''');
  }

  Future<int> insert(Quote quote) async {
    Database db = await instance.database;
    return await db.insert(table, quote.toMap());
  }

  Future<List<Quote>> getQuotes() async {
    Database db = await instance.database;
    var quotes = await db.query(table, orderBy: '$columnId ASC');
    return quotes.isNotEmpty ? quotes.map((c) => Quote.fromMap(c)).toList() : [];
  }

  Future<int> update(Quote quote) async {
    Database db = await instance.database;
    return await db.update(table, quote.toMap(), where: '$columnId = ?', whereArgs: [quote.id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
