import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../bloc/installation_wizard_bloc.dart';

@Injectable()
class InstallationWizardUsecase {
  InstallationWizardUsecase(
    this.localRepository,
    this.deviceManagementRepository,
  );

  final LocalRepository localRepository;
  final DeviceManagementRepository deviceManagementRepository;

  Future<String?> getSerialNumber() async {
    return await localRepository.getStringByKey("serialNumber");
  }

  Future<bool?> setSerialNumber(String serialNumber) async {
    return await localRepository.setStringByKey("serialNumber", serialNumber);
  }

  Future<InstallationWizardState?> getDeviceById(
    String serialNumber,
    Function(Device) callback,
  ) async {
    final response = await deviceManagementRepository.getDeviceId(serialNumber);
    if (response == null) {
      return InstallationWizardState(
        progress: 1,
        viewStatus: ViewStatus.error,
        errorMessage: LocaleKeys.failedToFetchDeviceInformation.tr(),
      );
    }

    if (response.message == 'Device Not Found !') {
      final responseRegister = await deviceManagementRepository.registerDevice(
        serialNumber,
        serialNumber,
      );

      if (responseRegister == null) {
        return InstallationWizardState(
          progress: 1,
          viewStatus: ViewStatus.error,
          errorMessage: LocaleKeys.failedToRegisterDevice.tr(),
        );
      }

      if (responseRegister.message == 'Device registered successfully') {
        return getDeviceById(serialNumber, callback);
      }
    }

    Device data = response.data as Device;

    if (!(data.isActive ?? false)) {
      subscribeWS(serialNumber, callback);
      return InstallationWizardState(
        progress: 1,
        viewStatus: ViewStatus.disabled,
      );
    } else {
      return InstallationWizardState(
        progress: 1,
        viewStatus: ViewStatus.success,
      );
    }
  }

  subscribeWS(String deviceId, Function(Device) callback) async {
    deviceManagementRepository.subscribeDevice(deviceId, callback);
  }
}
