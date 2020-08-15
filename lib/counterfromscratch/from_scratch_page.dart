import 'package:flutter/material.dart';

import 'counter_bloc_scratch.dart';
import 'event/counter_event.dart';

class FromScratchPage extends StatefulWidget {
  @override
  _FromScratchPageState createState() => _FromScratchPageState();
}

class _FromScratchPageState extends State<FromScratchPage> {
  final _blocScratch = CounterBlocScratch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc From Scratch'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _blocScratch.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            onPressed: () => _blocScratch.counterEventSink.add(CounterEvent.increment),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: null,
            onPressed: () => _blocScratch.counterEventSink.add(CounterEvent.decrement),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
