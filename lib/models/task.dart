import 'dart:math';

import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final List<int> color = [
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256)
  ];

  Task({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  String toString() {
    return "$title:$id";
  }
}
