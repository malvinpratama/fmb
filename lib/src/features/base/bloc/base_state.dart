part of 'base_bloc.dart';

class BaseState extends Equatable {
  final String topLeft;
  final Widget? topRight;
  final int signal;
  final bool signalStatus;
  final int wifi;
  final bool wifiStatus;
  final int batteryLevel;
  final bool batteryStatus;
  final String time;
  final int ping;
  final String serialNumber;
  final String connexNode;

  const BaseState({
    this.topLeft = '',
    this.topRight,
    this.signal = 0,
    this.signalStatus = false,
    this.wifi = 0,
    this.wifiStatus = false,
    this.batteryLevel = 0,
    this.batteryStatus = false,
    this.time = '',
    this.ping = 0,
    this.serialNumber = '-',
    this.connexNode = '-',
  });

  BaseState copyWith({
    String? topLeft,
    Widget? topRight,
    int? signal,
    bool? signalStatus,
    int? wifi,
    bool? wifiStatus,
    int? batteryLevel,
    bool? batteryStatus,
    String time = '',
    int? ping,
    String? serialNumber,
    String? connexNode,
  }) {
    return BaseState(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      signal: signal ?? this.signal,
      signalStatus: signalStatus ?? this.signalStatus,
      wifi: wifi ?? this.wifi,
      wifiStatus: wifiStatus ?? this.wifiStatus,
      batteryLevel: batteryLevel ?? this.batteryLevel,
      batteryStatus: batteryStatus ?? this.batteryStatus,
      time: time,
      ping: ping ?? this.ping,
      serialNumber: serialNumber ?? this.serialNumber,
      connexNode: connexNode ?? this.connexNode,
    );
  }

  @override
  List<Object?> get props => [
    topLeft,
    topRight,
    signal,
    signalStatus,
    wifi,
    wifiStatus,
    batteryLevel,
    batteryStatus,
    time,
    ping,
    serialNumber,
    connexNode,
  ];
}
