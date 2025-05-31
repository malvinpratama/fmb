import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState()) {
    init();
  }

  init() async {
    final initLocation = await Geolocator.getCurrentPosition();
    final mapController = MapController();
    emit(
      state.copyWith(initLocation: initLocation, mapController: mapController),
    );
    generateSpeed();
  }

  generateSpeed() {
    final random = Random();
    final number = random.nextInt(5) + 1;
    final operator = random.nextBool() ? '+' : '-';
    final currentSpeed = state.speed;
    final newOperator = currentSpeed >= 80 ? '-' : operator;
    final newSpeed = newOperator == '+' 
      ? currentSpeed + number 
      : currentSpeed - number;
    
    emit(state.copyWith(
      speed: newSpeed < 0 ? 0 : newSpeed,
    ));

    Future.delayed(Duration(seconds: 1)).then((_) => generateSpeed(),);
  }
}
