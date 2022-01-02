import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String name = "User";
  String rank = "Beginner";
  @HiveField(1)
  int level = 0;

  void setName(String value) {
    name = value;
  }

  void increaseLevel() {
    level++;
    updateRank();
  }

  void updateRank() {
    if (level <= 20) {
      rank = "Beginner";
    } else if (level <= 35) {
      rank = "procrastinator";
    } else if (level <= 50) {
      rank = "Student";
    } else if (level <= 80) {
      rank = "Multi-tasker";
    } else {
      rank = "Ahsan"; // cuz he's a business student
    }
  }
}
