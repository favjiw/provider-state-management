import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_amber, to_light_blue }

class ColorBlocLib extends Bloc<ColorEvent, Color> {
  ColorBlocLib() : super(Colors.amber) {
    on<ColorEvent>((event, emit) {
      if (event == ColorEvent.to_amber) {
        emit(Colors.amber);
      } else {
        emit(Colors.lightBlue);
      }
    });
  }
}
