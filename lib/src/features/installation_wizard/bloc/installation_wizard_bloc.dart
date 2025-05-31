import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../usecase/installation_wizard_usecase.dart';
part 'installation_wizard_state.dart';

class InstallationWizardBloc extends Cubit<InstallationWizardState> {
  InstallationWizardBloc(this.installationWizardUsecase)
    : super(const InstallationWizardState()) {
    init();
  }

  final InstallationWizardUsecase installationWizardUsecase;

  init() {
    getVersion();
    checkSerialNumber();
  }

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    emit(state.copyWith(version: packageInfo.version));
  }

  checkSerialNumber() async {
    String? serialNumber = await installationWizardUsecase.getSerialNumber();
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(progress: 0.5));
    if (serialNumber == null) {
      serialNumber = RandomStringGenerator.generateRandomString(15);
      await installationWizardUsecase.setSerialNumber(serialNumber);
      emit(state.copyWith(serialNumber: serialNumber));
    } else {
      if (serialNumber.isEmpty) {
        serialNumber = RandomStringGenerator.generateRandomString(15);
        await installationWizardUsecase.setSerialNumber(serialNumber);
        emit(state.copyWith(serialNumber: serialNumber));
      } else {
        emit(state.copyWith(serialNumber: serialNumber));
      }
    }

    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(progress: 0.8));

    installationWizardUsecase.getDeviceById(serialNumber, updateStatusWS).then((
      result,
    ) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          progress: result?.progress,
          viewStatus: result?.viewStatus,
          errorMessage: result?.errorMessage,
        ),
      );
    });
  }

  updateStatusWS(Device device) {
    if ((device.isActive ?? false)) {
      emit(state.copyWith(progress: 1, viewStatus: ViewStatus.success));
    }
  }
}
