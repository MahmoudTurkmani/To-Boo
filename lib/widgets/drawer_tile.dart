import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leading,
        style: Theme.of(context).textTheme.headline3,
      ),
      trailing: Text(
        trailing,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
