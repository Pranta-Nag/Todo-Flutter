
import 'package:flutter/material.dart';
import 'package:todo/ui/screens/todo_list/todo_list_screen.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TodoListScreen(),
        theme: _lightTheme(),
    );
}

  ThemeData _lightTheme() {
    return ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
       style:   ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12),
          fixedSize: Size.fromWidth(double.maxFinite),
         ),
        )
      );
  }
}