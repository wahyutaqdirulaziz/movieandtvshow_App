import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  int _seconds = 0;

  void onReady(BuildContext context) {
    _startTimer(context);
  }

  void _startTimer(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds += 1;

      if (_seconds == 10) {
        emit(Splashloaded());
        timer.cancel();
      }
    });
  }
}
