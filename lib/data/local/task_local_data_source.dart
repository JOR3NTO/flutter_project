import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/task.dart';

class TaskLocalDataSource {
  static const _dbName = 'tasks.db';
  static const _dbVersion = 1;
  static const _table = 'tasks';

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_table (
            id TEXT PRIMARY KEY,
            title TEXT NOT NULL,
            completed INTEGER NOT NULL DEFAULT 0,
            updatedAt TEXT NOT NULL,
            deleted INTEGER NOT NULL DEFAULT 0
          )
        ''');
      },
    );
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final maps = await db.query(_table);
    return maps.map((e) => Task.fromJson(e)).toList();
  }

  Future<void> insertTask(Task task) async {
    final db = await database;
    await db.insert(_table, task.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateTask(Task task) async {
    final db = await database;
    await db.update(_table, task.toJson(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(String id) async {
    final db = await database;
    await db.delete(_table, where: 'id = ?', whereArgs: [id]);
  }
}
