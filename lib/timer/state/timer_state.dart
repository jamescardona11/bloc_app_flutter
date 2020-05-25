import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];

  String getName();

  @override
  String toString() => '$getName { duration: $duration';
}

class Ready extends TimerState {
  Ready(int duration) : super(duration);

  @override
  String getName() => 'Ready';
}

class Paused extends TimerState {
  Paused(int duration) : super(duration);

  @override
  String getName() => 'Paused';
}

class Running extends TimerState {
  Running(int duration) : super(duration);

  @override
  String getName() => 'Running';
}

class Finished extends TimerState {
  Finished(int duration) : super(0);

  @override
  String getName() => 'Finished';
}
