import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class NameForm extends StatelessWidget {
  const NameForm({
    Key? key,
    required this.nameController,
    required this.currentUser,
  }) : super(key: key);

  final TextEditingController nameController;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          maxLength: 10,
          decoration: const InputDecoration(
            label: Text("Your Name"),
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            if (nameController.text.isNotEmpty) {
              currentUser.setName(nameController.text);
              Hive.box<User>('user').putAt(0, currentUser);
            }
            Navigator.of(context).pop();
          },
          child: const Text("Set Name"),
        )
      ],
    );
  }
}
