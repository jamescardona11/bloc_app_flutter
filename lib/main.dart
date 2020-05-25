import 'package:blocappflutter/counter/counterfromscratch/from_scratch_page.dart';
import 'package:blocappflutter/counter/counterlibrary/from_library_page.dart';
import 'package:blocappflutter/timer/page/timer_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,
      ),
      home: TimerPage(),
    );
  }
}
