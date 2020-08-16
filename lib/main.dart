import 'package:bloc/bloc.dart';
import 'package:blocappflutter/counterfromscratch/from_scratch_page.dart';
import 'package:blocappflutter/counter/counter_page.dart';
import 'package:blocappflutter/timer/timerview.dart';
import 'package:blocappflutter/validation/FormScreeenValidation.dart';
import 'package:blocappflutter/weather/cubit_weather_search_page.dart';
import 'package:flutter/material.dart';

import 'counter/counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
          /*primaryColor: Color.fromRGBO(109, 234, 255, 1),
        accentColor: Color.fromRGBO(72, 74, 126, 1),
        brightness: Brightness.dark,*/ //For TIMER
          ),
      home: Scaffold(
        body: _NavigatorIntern(),
      ),
    );
  }
}

class _NavigatorIntern extends StatelessWidget {
  final Map<String, Widget> screens = {
    'Counter from Scratch': FromScratchPage(),
    'Counter from Bloc': CounterPage(),
    'Weather Resocoder': CubitWeatherSearchPage(),
    'Timer': TimerPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: convertMapToList(context, screens),
      ),
    );
  }
}

List<Widget> convertMapToList(BuildContext context, screens) {
  List<Widget> listItems = [];
  screens.forEach(
    (key, value) => listItems.add(
      Card(
        child: ListTile(
          title: Text(key, style: TextStyle()),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => value));
          },
        ),
      ),
    ),
  );

  return listItems;
}
