import 'package:flutter/material.dart';
import 'package:todoo_list/models/todo.dart';
import 'package:todoo_list/pages/dbs_helper.dart';

class TodoListProvider with ChangeNotifier {
  List<TodoItem> _todos = [];

  TodoListProvider() {
    _loadTodosFromDatabase();
  }
  void addTodo({required TodoItem newTask}) {
     _todos.add(newTask);
     notifyListeners();
  }

  Future<void> _loadTodosFromDatabase() async {
    final dbHelper = DatabaseHelper.instance;
    final todosFromDatabase = await dbHelper.queryAll();
    _todos = todosFromDatabase;
    notifyListeners();

  }
  
List<TodoItem> get todoList {
    return _todos;
  }

  

  // Rest of your provider methods
}
 
