

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:todoo_list/components/todos_count_button.dart';
import 'package:todoo_list/constants/images.dart';
import 'package:todoo_list/data/todos.dart';
import 'package:todoo_list/models/todo.dart';
import 'package:todoo_list/pages/dbs_helper.dart';

import 'package:todoo_list/provider/todo_list_provider.dart';
import 'todo_list_page.dart';


class DataInputScreen extends StatefulWidget {
  static const String routeName = 'Data-Entry-Page';
   const DataInputScreen({Key? key}) : super(key: key);

  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  final TextEditingController _titleFieldController = TextEditingController();

  final TextEditingController _descriptionFieldController = TextEditingController();
   
   @override
     void dispose() {
    super.dispose();
    _titleFieldController.dispose();
    _descriptionFieldController.dispose();
   }

   void addToTodos() {
    TodoItem newTask=TodoItem(
      id: Todos.todos.length, 
      title: _titleFieldController.text,
       description: _descriptionFieldController.text,
        isCompleted: false);
        Todos.todos.add(newTask);
   }
   //method to add todoItem in todo list
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 77, 255, 1),
        title: const Text('Data Entry Screen'),
        centerTitle: true,
        actions: const [
          Padding(
            padding:  EdgeInsets.all(8.0),
            child: TodosCountButton(),
            )
        ],
      ),
     
       body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
               Images.dataInputScreenImage,
                height: 250,
              ),
            ),
             Flexible(
                  child: TextField(
                    controller: _titleFieldController,
                    decoration: const InputDecoration(
                      label: Text('Title'),border: OutlineInputBorder()),
                  ),
                ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _descriptionFieldController,
                    decoration: const InputDecoration(
                      label: Text('Description'),border: OutlineInputBorder()),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
         ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent,),
            
            onPressed: () async {
              final newTask = TodoItem(
    title: _titleFieldController.text,
    description: _descriptionFieldController.text,
    isCompleted: false,
  );

  final dbHelper = DatabaseHelper.instance;
  final id = await dbHelper.insert(newTask);

  newTask.id = id;
  Provider.of<TodoListProvider>(context, listen: false).addTodo(newTask: newTask);
              //for showing dialogue of todo added
              //   showDialog(context: context, builder:(context) {
              //   return const AlertDialog(
              //      title: Text("Todo"),
              //      content: Text("Added successfully"),
              //   );
              //  });

               addToTodos();
               _descriptionFieldController.clear();
               _titleFieldController.clear();
              },
               child: const Text('Add',
               style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18),))
          ],
        ),)
       
    );
  }
}

