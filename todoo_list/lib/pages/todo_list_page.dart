import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todoo_list/models/todo.dart';
import 'package:todoo_list/pages/dbs_helper.dart';
import 'package:todoo_list/provider/todo_list_provider.dart';

import '../data/todos.dart';

class TodoListPage extends StatefulWidget {
   static   bool _value=false;
 static const String routeName= 'todos-list-page';
 
 

 
  
    TodoListPage({Key? key}) : super(key: key);
   
  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
   Color _color = Colors.white;
   final List<Color> colors= [
   Colors.green[100]!,
     Colors.pink[50]!,
     Colors.blue[100]!,
     Colors.purple[50]!,
    Colors.yellow[100]!,
      Colors.green[100]!,
     Colors.pink[50]!,
     Colors.blue[100]!,
     Colors.purple[50]!,
    Colors.yellow[100]!,
      Colors.green[100]!,
     Colors.pink[50]!,
     Colors.blue[100]!,
     Colors.purple[50]!,
    Colors.yellow[100]!,
      Colors.green[100]!,
     Colors.pink[50]!,
     Colors.blue[100]!,
     Colors.purple[50]!,
    Colors.yellow[100]!,
      Colors.green[100]!,
     Colors.pink[50]!,
     Colors.blue[100]!,
     Colors.purple[50]!,
    Colors.yellow[100]!,
   ];


  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todos'),
            bottom: const TabBar(
              tabs: [
                Tab(text: "ListView",),
                Tab(text: "GridView",)
              ]
            ),),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
               const Text(
                  'My Todos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16,),
                Consumer<TodoListProvider>(
                  builder: ((context,todoListProvider,child) => Expanded(
                    child: TabBarView(
                  
                      children:[ 
                        ListView.builder(
                        itemCount:todoListProvider.todoList.length,
                        itemBuilder: (context, index){
                    
                        return  ListTile(
                        title:  Text(todoListProvider.todoList[index].title),
                        subtitle:  Text(todoListProvider.todoList[index].description),
                        trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        IconButton(
                           icon: Icon(Icons.delete),
                           onPressed: ()async {
                            final dbHelper = DatabaseHelper.instance;
                            final id = todoListProvider.todoList[index].id!;
                            await dbHelper.delete(id);

                            setState(() {
                              // Remove the deleted item from the list
                              todoListProvider.todoList.removeAt(index);
                            });
                           },),
                           IconButton(
                           icon: Icon(Icons.edit),
                           onPressed: ()async {
                            final TodoItem todo = todoListProvider.todoList[index];
                                final dbHelper = DatabaseHelper.instance;
                            //final id = todoListProvider.todoList[index].id!;
                            await dbHelper.update(todo);

                           },),
                      ],
                    ),
                                     //   secondary: ico,
                        autofocus: false,
                       
                        selected: TodoListPage._value,
                        
                        selectedTileColor: Colors.purple.shade100,
                        shape: RoundedRectangleBorder( 
                        side: BorderSide(width: 2,color: Colors.purple),
                    
                        borderRadius: BorderRadius.circular(20),
                        
                          ),
                                   
                                );
                         
                        }),
                        GridView.builder(
                          itemCount: todoListProvider.todoList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                           crossAxisCount: 2,  
                           crossAxisSpacing: 4.0,  
                           mainAxisSpacing: 4.0  
              ),  
                           itemBuilder: (context,index) {
                             return Card(
                              borderOnForeground: true,
                              color: colors[index],
                             child: Column(
                               children: [
                                 Center(
                                   child: ListTile(
                                   title : Text(todoListProvider.todoList[index].title),
                                   subtitle:Text(todoListProvider.todoList[index].description)),
                                 
            // Add any other Card properties you want
          ),
            ],
         ),
        );
    
       },)]
))))]) ,
            ),),
        ),
    );
    
  }
}
//todoListProvider.todoList[index].title