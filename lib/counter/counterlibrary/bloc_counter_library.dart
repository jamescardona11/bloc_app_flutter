import 'package:blocappflutter/counter/event/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocLibrary extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;

      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
