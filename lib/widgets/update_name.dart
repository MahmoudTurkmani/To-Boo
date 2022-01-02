import 'package:flutter/material.dart';

import '../models/user.dart';
import './name_form.dart';

class UpdateName extends StatelessWidget {
  const UpdateName({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) {
            TextEditingController nameController = TextEditingController();
            return Dialog(
              child: SizedBox(
                width: 300,
                height: 160,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: NameForm(
                      nameController: nameController, currentUser: currentUser),
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(
        Icons.edit,
        color: Color.fromRGBO(230, 244, 241, 1),
      ),
    );
  }
}
