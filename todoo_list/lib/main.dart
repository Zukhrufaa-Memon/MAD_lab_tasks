import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoo_list/pages/data_input_screen.dart';
import 'package:todoo_list/pages/splash_screen.dart';
import 'package:todoo_list/pages/todo_list_page.dart';
import 'package:todoo_list/provider/todo_list_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
Future main() async {
// Initialize FFI
sqfliteFfiInit();
 databaseFactory = databaseFactoryFfi;
 runApp(MyApp());
}
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoListProvider(), //here changenotifierprovider is creating instance of todolistprovider
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
       initialRoute: SplashScreen.routeName,
       routes: {
        SplashScreen.routeName:(context) => const SplashScreen(),
        DataInputScreen.routeName:(context) => const DataInputScreen(),
        TodoListPage.routeName:(context) =>  TodoListPage(),
       },
     ),
    );
  }
}

