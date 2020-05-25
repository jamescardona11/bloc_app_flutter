import 'dart:async';

import 'package:blocappflutter/counter/event/counter_event.dart';

class CounterBlocScratch {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBlocScratch() {
    _counterEventController.stream.listen(mapEventToState);
  }

  void mapEventToState(CounterEvent event) {
    switch (event) {
      case CounterEvent.increment:
        _counter++;
        break;

      case CounterEvent.decrement:
        _counter--;
        break;
    }

    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
