import 'package:flutter/material.dart';
import 'package:todo/entities/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onIconButtonPressed,
  });
  final Todo todo;
  final VoidCallback onIconButtonPressed;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      surfaceTintColor: _buildSurfaceTintColor(todo.isdone),
      color: _buildColor(todo.isdone),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: _buildTextDecoration(todo.isdone),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.subtitle),
            Text(todo.time.toString()),
          ],
        ),
        trailing: _buildRoundedIconButton(todo.isdone),
      ),
    );
  }

  Widget _buildRoundedIconButton(bool isdone) {
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: CircleAvatar(
        child: Icon(
          _buildIcon(!todo.isdone),
        ),
      ),
    );
  }

  IconData _buildIcon(bool isdone) {
    return isdone ? Icons.check : Icons.clear;
  }

  TextDecoration? _buildTextDecoration(bool isdone) {
    return isdone ? TextDecoration.lineThrough : null;
  }

  Color? _buildSurfaceTintColor(bool isdone){
    return isdone ? Colors.green : null;
  }
   Color? _buildColor(bool isdone){
    return isdone ? Colors.pink.shade200 : null;
  }
}
