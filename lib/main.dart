import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productivity/controller/central_state.dart';
import 'package:productivity/style/style.dart';
import 'package:productivity/style/theme.dart';
import 'package:productivity/view/add_habit/add_habit_page/add_habit_page.dart';

import 'view/home/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundDark
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      darkTheme: themeData,
      themeMode: ThemeMode.dark,
      home: Home(),
      routes: <String, WidgetBuilder>{
        AddHabitPage.route: (BuildContext context) => AddHabitPage(),
      },
    );
  }
}
