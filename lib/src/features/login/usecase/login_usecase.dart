import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../bloc/login_bloc.dart';

@Injectable()
class LoginUsecase {
  LoginUsecase(this.loginRepository);
  final LoginRepository loginRepository;

  Future<LoginState> login(String nik) async {
    DateTime now = DateTime.now();
    String shiftId = now.hour >= 5 && now.hour < 17 ? '048C-DS' : '048C-NS';
    final response = await loginRepository.loginTabletUnit(nik, shiftId);
    if (response == null) {
      return LoginState(
        viewStatusButton: ViewStatus.enabled,
        errorMessage: LocaleKeys.internalServerError.tr(),
      );
    }
    if (response.message == "User does not exist") {
      return LoginState(
        viewStatusButton: ViewStatus.enabled,
        errorMessage: LocaleKeys.cantFindYourNIK.tr(),
      );
    } else if (response.message == "Unit does not exist") {
      return LoginState(
        viewStatusButton: ViewStatus.enabled,
        errorMessage: LocaleKeys.cantFindYourNIK.tr(),
      );
    } else {
      return LoginState(
        viewStatusButton: ViewStatus.success,
        userDevice: response.data as UserDevice,
      );
    }
  }
}
