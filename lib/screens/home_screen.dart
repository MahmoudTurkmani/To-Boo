import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../widgets/todo_tile.dart';
import '../widgets/app_drawer.dart';
import '../models/task.dart';
import './add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          Text(
            "TO-BOO!",
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: Hive.box<Task>('tasks').watch(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    if (Hive.box<Task>('tasks').values.isEmpty)
                      Center(
                        child: Image.asset("assets/images/emptyList.gif"),
                      ),
                    if (Hive.box<Task>('tasks').values.isNotEmpty)
                      ...Hive.box<Task>('tasks')
                          .values
                          .map((e) => ToDoTile(task: e))
                  ],
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(AddTaskScreen.routeName),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
