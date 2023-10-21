

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../pages/todo_list_page.dart';
import '../provider/todo_list_provider.dart';

class TodosCountButton extends StatelessWidget {
  const TodosCountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
         IconButton(icon: const Icon(Icons.check_box_outlined),
      onPressed: () {
        Navigator.pushNamed(context, TodoListPage.routeName);
      },),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle 
        ),
        child: Center(
          child: Consumer<TodoListProvider>(
            builder: ((context, value, child) =>
             Text(value.todoList.length.toString(),
             style: const TextStyle(fontWeight: FontWeight.bold),))),
        )
      )   
      ],
    );
  }
}