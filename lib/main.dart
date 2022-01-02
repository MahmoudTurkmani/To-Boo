import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './screens/home_screen.dart';
import './screens/add_task_screen.dart';
import 'models/task.dart';
import './models/user.dart';

Future<void> main() async {
  //Some Hive config lines
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  // Registering the adapters for task and User
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(UserAdapter());
  // Creating the boxes
  await Hive.openBox<Task>('tasks');
  await Hive.openBox<User>('user');
  // If no user exists, make one
  if (Hive.box<User>('user').isEmpty) {
    Hive.box<User>('user').add(User());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Some themeing
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color.fromRGBO(136, 199, 220, 1),
              secondary: const Color.fromRGBO(0, 59, 77, 1),
              secondaryVariant: const Color.fromRGBO(230, 244, 241, 1),
            ),
        scaffoldBackgroundColor: const Color.fromRGBO(136, 199, 220, 1),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontFamily: "Dosis",
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Color.fromRGBO(0, 59, 77, 1),
          ),
          foregroundColor: Color.fromRGBO(0, 59, 77, 1),
        ),
        textTheme: const TextTheme(
          headline3: TextStyle(
            fontFamily: "Dosis",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(230, 244, 241, 1),
          ),
          headline4: TextStyle(
            fontFamily: "Dosis",
            fontWeight: FontWeight.w900,
            fontSize: 46,
            color: Color.fromRGBO(0, 59, 77, 1),
            letterSpacing: 2,
          ),
          bodyText2: TextStyle(
            fontFamily: "Dosis",
            fontSize: 18,
            color: Color.fromRGBO(230, 244, 241, 1),
          ),
          button: TextStyle(
            fontFamily: "Dosis",
            fontSize: 18,
            color: Color.fromRGBO(230, 244, 241, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromRGBO(0, 59, 77, 1),
            ),
          ),
        ),
      ),
      routes: {
        '/': (ctx) => const HomeScreen(),
        AddTaskScreen.routeName: (ctx) => const AddTaskScreen(),
      },
    );
  }
}
