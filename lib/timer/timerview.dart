import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'backgroud.dart';
import 'bloc/timer_bloc.dart';
import 'ticker.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: Ticker()),
      child: _Timer(),
    );
  }
}

class _Timer extends StatelessWidget {
  static const TextStyle timerTextStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Timer')),
      body: Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      final String minutesStr = ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
                      final String secondsStr = (state.duration % 60).floor().toString().padLeft(2, '0');
                      return Text(
                        '$minutesStr:$secondsStr',
                        style: _Timer.timerTextStyle,
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                buildWhen: (previousState, currentState) => currentState.runtimeType != previousState.runtimeType,
                builder: (context, state) => Actions(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
