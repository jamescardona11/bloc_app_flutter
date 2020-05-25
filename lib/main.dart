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
      title: 'Flutter Bloc Demo',
      home: TimerPage(),
    );
  }
}
