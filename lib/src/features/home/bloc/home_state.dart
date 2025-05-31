part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Position? initLocation;
  final MapController? mapController;
  final int speed;

  const HomeState({this.initLocation, this.mapController, this.speed = 0});

  HomeState copyWith({
    Position? initLocation,
    MapController? mapController,
    int? speed,
  }) {
    return HomeState(
      initLocation: initLocation ?? this.initLocation,
      mapController: mapController ?? this.mapController,
      speed: speed ?? this.speed,
    );
  }

  @override
  List<Object?> get props => [initLocation, mapController, speed];
}
