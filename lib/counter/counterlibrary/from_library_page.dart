import 'package:blocappflutter/counter/counterlibrary/bloc_counter_library.dart';
import 'package:blocappflutter/counter/event/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FromLibraryPage extends StatelessWidget {
  static final String id = 'from_library_page_route_id';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBlocLibrary>(
      create: (context) => CounterBlocLibrary(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bloc From Scratch'),
        ),
        body: _CounterPage(),
        floatingActionButton: _FloatingWidgetButton(),
      ),
    );
  }
}

class _FloatingWidgetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBlocLibrary counterBloc = BlocProvider.of<CounterBlocLibrary>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () => counterBloc.add(CounterEvent.increment),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () => counterBloc.add(CounterEvent.decrement),
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}

class _CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: BlocBuilder<CounterBlocLibrary, int>(
      builder: (context, count) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        );
      },
    ));
  }
}
