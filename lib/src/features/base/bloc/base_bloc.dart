import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../../utils/utils.dart';
part 'base_state.dart';

class BaseBloc extends Cubit<BaseState> {
  BaseBloc() : super(const BaseState()) {
    init();
  }

  init() {
    // TODO : _signalRefresher(), _wifiRefresher(), _batteryRefresher() need test on real device.
    _signalRefresher();
    _wifiRefresher();
    _timeRefresher();
    _batteryRefresher();
    emit(state.copyWith(topLeft: LocaleKeys.installationWizard.tr()));
  }

  _signalRefresher() async {
    if (!UniversalPlatform.isLinux) {
      emit(state.copyWith(signal: 0, signalStatus: false));
      return;
    }
    final signalResult = await Process.run('mmcli', [
      '-m',
      '0',
      '--signal-get',
    ]);
    final signalOutput = signalResult.stdout.toString();

    final signalMatch = RegExp(
      r'signal quality:\s+(\d+)%',
      caseSensitive: false,
    ).firstMatch(signalOutput);

    final strength = signalMatch != null ? int.parse(signalMatch.group(1)!) : 0;

    emit(state.copyWith(signal: strength, signalStatus: true));

    Future.delayed(Duration(minutes: 1), () => _signalRefresher());
  }

  _wifiRefresher() async {
    if (!UniversalPlatform.isLinux) {
      emit(state.copyWith(wifi: 0, wifiStatus: false));
      return;
    }

    final result = await Process.run('iwconfig', ['wlan0']);

    if (result.exitCode != 0) return null;

    final output = result.stdout.toString();

    final signalLine = output
        .split('\n')
        .firstWhere((line) => line.contains('Signal level='), orElse: () => '');

    if (signalLine.isEmpty) return null;

    final regex = RegExp(r'Signal level=([-0-9]+) dBm');
    final match = regex.firstMatch(signalLine);

    if (match == null) return null;

    final signalDbm = int.tryParse(match.group(1)!);

    final wifiPercentage = _dbmToPercent(signalDbm ?? -200);

    emit(state.copyWith(wifi: wifiPercentage, wifiStatus: true));

    Future.delayed(Duration(minutes: 1), () => _wifiRefresher());
  }

  _timeRefresher() async {
    //  final result = await Process.run('date', []);
    final now = DateTime.now();
    final time = DateFormat('HH:mm').format(now);

    emit(state.copyWith(time: time));

    Future.delayed(Duration(seconds: 1), () => _timeRefresher());
  }

  _batteryRefresher() {
    if (!UniversalPlatform.isLinux) {
      emit(state.copyWith(batteryLevel: 0, batteryStatus: false));
      return;
    }
    Battery battery = Battery();

    battery.batteryLevel
        .then((batteryLevel) {
          emit(state.copyWith(batteryLevel: batteryLevel, batteryStatus: true));
        })
        .whenComplete(
          () => Future.delayed(Duration(minutes: 3), () => _batteryRefresher()),
        );
  }

  int _dbmToPercent(int dbm) {
    if (dbm >= -50) return 100;
    if (dbm <= -100) return 0;
    return ((dbm + 100) * 2).clamp(0, 100);
  }

  changeTopLeft(String topLeft) {
    emit(state.copyWith(topLeft: topLeft));
  }

  changeTopRight(Widget topRight) {
    emit(state.copyWith(topRight: topRight));
  }
}
