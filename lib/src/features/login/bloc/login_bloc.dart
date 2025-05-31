import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../../models/models.dart';
import '../usecase/login_usecase.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc(this.loginUseCase) : super(const LoginState()) {
    init();
  }

  final LoginUsecase loginUseCase;

  init() {
    emit(state.copyWith(focusNode: FocusNode()));

    state.focusNode?.addListener(focusNodeListener);
  }

  focusNodeListener() {
    if (state.focusNode?.hasFocus ?? false) {
      if (!state.onboard) {
        emit(state.copyWith(onboard: true));
        if (UniversalPlatform.isLinux) {
          // Process.run('onboard', []);
        }
      }
    } else {
      emit(state.copyWith(onboard: false));
    }
  }

  onChangeNik(String nik) {
    ViewStatus viewStatusButton = ViewStatus.enabled;
    if (nik.isEmpty && state.viewStatusButton != ViewStatus.loading) {
      viewStatusButton = ViewStatus.disabled;
    }
    emit(state.copyWith(nik: nik, viewStatusButton: viewStatusButton));
  }

  onSubmit() {
    emit(
      state.copyWith(viewStatusButton: ViewStatus.loading, errorMessage: ''),
    );
    loginUseCase.login(state.nik).then((result) {
      emit(
        state.copyWith(
          viewStatusButton: result.viewStatusButton,
          errorMessage: result.errorMessage,
          userDevice: result.userDevice,
        ),
      );
    });
  }
}
