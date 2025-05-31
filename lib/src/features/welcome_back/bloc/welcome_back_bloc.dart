import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../usecase/welcome_back_usecase.dart';
part 'welcome_back_state.dart';

class WelcomeBackBloc extends Cubit<WelcomeBackState> {
  WelcomeBackBloc(this.userDevice, this.welcomeBackUsecase)
    : super(WelcomeBackState()) {
    init();
  }
  final UserDevice? userDevice;
  final WelcomeBackUsecase welcomeBackUsecase;
  init() {
    emit(state.copyWith(userDevice: userDevice));
    welcomeBackUsecase.getIncrementalValue().listen((value) {
      emit(
        state.copyWith(
          progress: value,
          viewStatus: value >= 1.0 ? ViewStatus.success : ViewStatus.loading,
        ),
      );
    });
  }
}
