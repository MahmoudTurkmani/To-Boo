import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/task.dart';
import '../models/user.dart';

class ToDoTile extends StatelessWidget {
  final Task task;

  const ToDoTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      // Delete from the box and update the user
      onDismissed: (direction) {
        Hive.box<Task>('tasks').delete(task.key);
        User currentUser = Hive.box<User>('user').getAt(0)!..increaseLevel();
        Hive.box<User>('user').putAt(0, currentUser);
      },
      // The background with the trash icon
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          size: 46,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        elevation: 2,
        color: const Color.fromRGBO(0, 69, 77, 1),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const Divider(),
                  Text(task.description),
                ],
              ),
              Positioned(
                child: Image.asset(
                  "assets/images/ghostHold.gif",
                  height: 50,
                  color: Color.fromRGBO(
                      task.color[0], task.color[1], task.color[2], 1),
                ),
                right: -32,
                top: -45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
