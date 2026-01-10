import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../fake_data.dart';

class FruitHupDatabase {
  static final FruitHupDatabase instance = FruitHupDatabase._internal();
  static Database? _database;

  FruitHupDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'fruit_hup.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE salads (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price INTEGER NOT NULL,
        image TEXT NOT NULL,
        ingredients TEXT,
        description TEXT,
        color INTEGER,
        categories TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cartItem TEXT,
        totalPrice INTEGER
      )
    ''');

    for (final salad in fakeSalads) {
      await db.insert('salads', salad.toMap());
    }

    // fake cart data
    await db.insert('cart', fakeCart.toMap());

  }
}

