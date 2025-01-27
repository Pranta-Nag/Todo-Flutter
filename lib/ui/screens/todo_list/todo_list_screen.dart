import 'package:flutter/material.dart';
import 'package:todo/entities/todo.dart';
import 'package:todo/ui/screens/add_new_todo_screen.dart';
import 'package:todo/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:todo/ui/screens/todo_list/done_todo_list_tab.dart';
import 'package:todo/ui/screens/todo_list/undone_todo_list_tab.dart';


class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen>
    with SingleTickerProviderStateMixin {
  List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:const Text("TODO LIST"),
          bottom: _buildTabBar(),
        ),
        body:const TabBarView(
          children: [
          AllTodoListTab(),
          UndoneTodoListTab(),
          DoneTodoListTab(),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewTodoScreen(),
              ),
            );
          },
          label: Text("Add"),
          icon: Icon(Icons.add),
          tooltip: "Add todo Item",
        ),
      ),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
          tabs: [
          Tab(
            text: "All",
          ),
          Tab(
            text: "UnDone",
          ),
          Tab(
            text: "Done",
          ),
        ]);
  }
}
