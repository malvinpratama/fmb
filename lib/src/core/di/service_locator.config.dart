// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fmb/src/core/core.dart' as _i976;
import 'package:fmb/src/core/repositories/device_management_repository.dart'
    as _i913;
import 'package:fmb/src/core/repositories/local_repository.dart' as _i995;
import 'package:fmb/src/core/repositories/login_repository.dart' as _i1019;
import 'package:fmb/src/core/services/database_service.dart' as _i866;
import 'package:fmb/src/core/services/logger_service.dart' as _i828;
import 'package:fmb/src/core/services/network_service.dart' as _i200;
import 'package:fmb/src/features/installation_wizard/usecase/installation_wizard_usecase.dart'
    as _i960;
import 'package:fmb/src/features/login/usecase/login_usecase.dart' as _i476;
import 'package:fmb/src/features/welcome_back/usecase/welcome_back_usecase.dart'
    as _i378;
import 'package:fmb/src/utils/env.dart' as _i85;
import 'package:fmb/src/utils/utils.dart' as _i469;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i378.WelcomeBackUsecase>(() => _i378.WelcomeBackUsecase());
    gh.lazySingleton<_i85.Env>(() => _i85.Env());
    gh.lazySingleton<_i866.DatabaseService>(() => _i866.DatabaseService());
    gh.lazySingleton<_i828.LoggerService>(() => _i828.LoggerService());
    gh.lazySingleton<_i200.NetworkService>(
      () => _i200.NetworkService(gh<_i469.Env>()),
    );
    gh.factory<_i1019.LoginRepository>(
      () => _i1019.LoginRepository(gh<_i976.NetworkService>()),
    );
    gh.factory<_i995.LocalRepository>(
      () => _i995.LocalRepository(gh<_i976.DatabaseService>()),
    );
    gh.factory<_i476.LoginUsecase>(
      () => _i476.LoginUsecase(gh<_i976.LoginRepository>()),
    );
    gh.factory<_i913.DeviceManagementRepository>(
      () => _i913.DeviceManagementRepository(
        gh<_i976.NetworkService>(),
        gh<_i469.Env>(),
      ),
    );
    gh.factory<_i960.InstallationWizardUsecase>(
      () => _i960.InstallationWizardUsecase(
        gh<_i976.LocalRepository>(),
        gh<_i976.DeviceManagementRepository>(),
      ),
    );
    return this;
  }
}
