import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  static const String routeName = "/add-task";

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    // The save button at the end of the form
    Widget saveButton = Align(
      alignment: Alignment.topRight,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Task newTask = Task(
              id: UniqueKey().toString(),
              title: titleController.text,
              description: descriptionController.text,
            );
            Hive.box<Task>('tasks').add(newTask);
            Navigator.of(context).pop();
          }
        },
        child: const Text("Add"),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Task"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: titleController,
                  decoration: FieldDecoration("Task Title", context),
                  maxLength: 30,
                  validator: (val) =>
                      val!.isEmpty ? "Please enter a title" : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: FieldDecoration("Task Description", context),
                  maxLength: 120,
                  validator: (val) =>
                      val!.isEmpty ? "Please enter a description" : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                saveButton,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Image.asset("assets/images/taskGhost.gif"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// The InputDecoration for the two input fields
InputDecoration FieldDecoration(String title, BuildContext context) {
  return InputDecoration(
    labelText: title,
    labelStyle: Theme.of(context).textTheme.headline3!.copyWith(
          color: const Color.fromRGBO(0, 59, 77, 1),
        ),
    fillColor: const Color.fromRGBO(230, 244, 241, 1),
    filled: true,
  );
}
