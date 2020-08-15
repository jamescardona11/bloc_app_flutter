import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    debugPrint('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }
}
