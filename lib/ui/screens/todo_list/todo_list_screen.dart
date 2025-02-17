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
  final List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TODO LIST"),
          backgroundColor: Colors.orangeAccent.shade400,
          bottom: _buildTabBar(),
        ),
        body: TabBarView(children: [
          AllTodoListTab(
            todoList: _todoList,
            onDelete: _deleteTodo,
            onStatusChange: _toggoleTodoState,
          ),
          UndoneTodoListTab(
             todoList: _todoList.where((item) => item.isdone == false).toList(),
            onDelete: _deleteTodo,
            onStatusChange: _toggoleTodoState,
          ),
          DoneTodoListTab(
            todoList: _todoList.where((item) => item.isdone == true).toList(),
            onDelete: _deleteTodo,
            onStatusChange: _toggoleTodoState,
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewTodoScreen(addNewTodo: _addNewTodo),
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
    return const TabBar(tabs: [
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

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggoleTodoState(int index) {
    _todoList[index].isdone = !_todoList[index].isdone;
    if (mounted) {
      setState(() {});
    }
  }
}
