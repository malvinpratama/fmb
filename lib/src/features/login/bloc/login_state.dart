part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FocusNode? focusNode;
  final String nik;
  final String shiftId;
  final ViewStatus viewStatusButton;
  final String errorMessage;
  final UserDevice? userDevice;
  final bool onboard;

  const LoginState({
    this.focusNode,
    this.nik = '',
    this.shiftId = '',
    this.viewStatusButton = ViewStatus.disabled,
    this.errorMessage = '',
    this.userDevice,
    this.onboard = false,
  });

  LoginState copyWith({
    FocusNode? focusNode,
    String? nik,
    String? shiftId,
    ViewStatus? viewStatusButton,
    String? errorMessage,
    UserDevice? userDevice,
    bool? onboard,
  }) {
    return LoginState(
      focusNode: focusNode ?? this.focusNode,
      nik: nik ?? this.nik,
      shiftId: shiftId ?? this.shiftId,
      viewStatusButton: viewStatusButton ?? this.viewStatusButton,
      errorMessage: errorMessage ?? this.errorMessage,
      userDevice: userDevice ?? this.userDevice,
      onboard: onboard ?? this.onboard,
    );
  }

  @override
  List<Object?> get props => [
    focusNode,
    nik,
    shiftId,
    viewStatusButton,
    errorMessage,
    userDevice,
    onboard,
  ];
}
