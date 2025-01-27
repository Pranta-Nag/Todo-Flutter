import 'package:flutter/material.dart';
import 'package:todo/entities/todo.dart';
import 'package:todo/ui/widgets/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget {
  const UndoneTodoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {},
              child: TodoItem(
                todo: Todo(
                  'Title will be here',
                  'description sfhsdfsdfg',
                  DateTime.now(),
                ),
                onIconButtonPressed: () {},
              ),
            );
          });
  }
}