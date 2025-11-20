import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todolist.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        category TEXT,
        date TEXT,
        time TEXT,
        note TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.insert('categories', {'name': 'Work'});
    await db.insert('categories', {'name': 'Personal'});
    await db.insert('categories', {'name': 'Shopping'});
    await db.insert('categories', {'name': 'Health'});
  }

  Future<int> addTask({
    required String title,
    String? category,
    String? date,
    String? time,
    String? note,
  }) async {
    final db = await instance.database;
    final data = {
      'title': title,
      'category': category,
      'date': date,
      'time': time,
      'note': note,
    };
    return await db.insert('tasks', data);
  }

  Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await instance.database;
    return await db.query('tasks', orderBy: 'id DESC');
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await instance.database;
    return await db.query('categories', orderBy: 'id ASC');
  }

  Future<int> addCategory(String name) async {
    final db = await instance.database;
    return await db.insert('categories', {'name': name});
  }

  Future<int> deleteCategory(int id) async {
    final db = await instance.database;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
