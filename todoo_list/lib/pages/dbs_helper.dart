import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoo_list/models/todo.dart';

class DatabaseHelper {
  static final _databaseName = 'todos.db';
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        isCompleted INTEGER
      )
    ''');
  }
  Future<int> insert(TodoItem todo) async {
    Database db = await database;
    return await db.insert('todos', todo.toMap());
  }

   Future<void> addTodo(TodoItem todo) async {
    await insert(todo);
  }

 Future<void> delete(int id) async {
    Database db = await database;
    await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> update(TodoItem todo) async {
    Database db = await database;
    await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<List<TodoItem>> queryAll() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return TodoItem.fromMap(maps[i]);
    });
  }

  // Add methods for CRUD operations (insert, query, update, delete)
}




// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:todoo_list/models/todo.dart';

// class Dbs_Helper {
//    Database? _database;
//   String tablename="todos";
//   static final Dbs_Helper instance = Dbs_Helper._init();
//   Dbs_Helper._init();

//   Future<Database> get database async {
//     if (_database!=null) {
//       return _database!;
//     }
//     else {
//       _database=await initDb();
//       return _database!;
//     }
//   }
//   Future<void> updateTodoStatus(TodoItem todo, bool isCompleted) async {
//     final db = await database;
//     await db.update(
//       'todos',
//       {
//         'isCompleted': isCompleted ? 1 : 0,
//       },
//       where: 'id = ?',
//       whereArgs: [todo.id],
//     );
//   }

//   Future<Database> initDb() async {
//     final dbpath=await getDatabasesPath();
//     final todo_db_path=join(dbpath,"todos.db");
//     return await openDatabase(
//       todo_db_path,
//       version: 1,
//       onCreate: (db,version) {
//         db.execute("Create TABLE $tablename(id INTEGER KEY,title TEXT,description TEXT,isCompleted INTEGER)");
//       }
//     );
//   }
//   Future<List<Map<String,dynamic>>>queryAll() async {
//       final db=await database;
//       return await db.query(tablename);
//     }

//   insert (TodoItem todo) async {
//     final db=await database;
//     await db.insert(tablename, {
//       "id":todo.id,
//       "title":todo.title,
//       "description":todo.description     
//     });

//   update(TodoItem todo) async {
//     final db=await database;
//     await db.update(tablename, {
//       "id":todo.id,
//       "title":todo.title,
//       "description":todo.description
//     },
//     where: 'id=?',
//     whereArgs: [todo.id]);  
//   }

    
//   }

//   static void initState() {}
// }