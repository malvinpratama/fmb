part of 'welcome_back_bloc.dart';

class WelcomeBackState extends Equatable {
  final UserDevice? userDevice;
  final double progress;
  final ViewStatus viewStatus;
  const WelcomeBackState({
    this.userDevice,
    this.progress = 0.0,
    this.viewStatus = ViewStatus.loading,
  });

  WelcomeBackState copyWith({
    UserDevice? userDevice,
    double? progress,
    ViewStatus? viewStatus,
  }) {
    return WelcomeBackState(
      userDevice: userDevice ?? this.userDevice,
      progress: progress ?? this.progress,
      viewStatus: viewStatus ?? this.viewStatus,
    );
  }

  @override
  List<Object?> get props => [userDevice, progress, viewStatus];
}
