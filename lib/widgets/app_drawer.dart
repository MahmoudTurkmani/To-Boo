import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import "../models/user.dart";
import './update_name.dart';
import './drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User currentUser = Hive.box<User>('user').get(0)!;

    return Drawer(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            // Using a stream here in case the user updates something (such as the name)
            child: StreamBuilder(
                stream: Hive.box<User>('user').watch(),
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Color.fromRGBO(230, 244, 241, 1),
                        foregroundImage:
                            AssetImage("assets/images/userPic.png"),
                      ),
                      Text(
                        "Welcome,",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 40,
                              color: const Color.fromRGBO(230, 244, 241, 1),
                            ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        Hive.box<User>('user').get(0)!.name,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 40,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      UpdateName(currentUser: currentUser),
                      DrawerTile(
                        leading: "Level: ",
                        trailing: "${currentUser.level}",
                      ),
                      DrawerTile(
                        leading: "Rank: ",
                        trailing: currentUser.rank,
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
