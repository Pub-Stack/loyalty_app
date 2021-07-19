import 'package:bonus_app/presentation/pages/cabinet.dart';
import 'package:bonus_app/presentation/pages/edit.dart';
import 'package:bonus_app/presentation/pages/login_page.dart';
import 'package:bonus_app/presentation/pages/profile.dart';
import 'package:flutter/material.dart';

import 'domain/logic.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logic.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonus App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: TextTheme(
          //bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 18),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/cabinet': (context) => CabinetPage(),
        '/profile': (context) => ProfilePage(),
        '/edit': (context) => EditPage(),
      },
    );
  }
}
