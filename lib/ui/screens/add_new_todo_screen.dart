import 'package:flutter/material.dart';
import 'package:todo/entities/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key, required this.addNewTodo});

  final Function(Todo) addNewTodo;

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {

final TextEditingController _titleTeController = TextEditingController();
final TextEditingController _descriptionTeController = TextEditingController();
final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new screen"),),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTeController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title',
                ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter a Title';
                  }
                    return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionTeController,
                decoration: InputDecoration(
                  hintText: 'Description',
                  labelText: 'Description',
                ),
                maxLength: 200,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                 validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter your Description';
                  }
                    return null;
                },
              ),
               const SizedBox(height: 10),
               ElevatedButton(onPressed: (){
                if(_fromKey.currentState!.validate()){
                  Todo todo = Todo(_titleTeController.text.trim(), _descriptionTeController.text.trim(), DateTime.now());
                  widget.addNewTodo(todo);
                  Navigator.pop(context);
                }

               }, child: Text("Add"),),
            ],
          ),
        ),
      ),
    );

    
  }
  @override
  void dispose() {
    _titleTeController.dispose();
    _descriptionTeController.dispose();
    super.dispose();
  }
}