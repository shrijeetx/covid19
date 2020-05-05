import 'package:covid19/screens/about_me.dart';
import 'package:covid19/screens/india_data.dart';
import 'package:covid19/screens/main_screen.dart';
import 'package:covid19/screens/stay_safe.dart';
import 'package:flutter/material.dart';
import 'screens/world_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.black,),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/staysafe': (context) => StaySafe(),
        '/worlddata': (context) => WorldData(),
        '/indiadist': (context) => IndiaDist(),
        '/aboutme': (context) => AboutMe(),
      },
    );
  }
}
