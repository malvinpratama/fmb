import 'package:centrifuge/centrifuge.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../utils/utils.dart';

@LazySingleton()
class NetworkService {
  NetworkService(this._env);
  
  final Env _env;

  Dio client() {
    return Dio(
        BaseOptions(
          baseUrl: _env.baseUrl,
          connectTimeout: const Duration(minutes: 1),
          followRedirects: false,
        ),
      )
      ..interceptors.addAll([
        TalkerDioLogger(
          settings: TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
            // Blue http requests logs in console
            requestPen: AnsiPen()..blue(),
            // Green http responses logs in console
            responsePen: AnsiPen()..green(),
            // Error http logs in console
            errorPen: AnsiPen()..red(),
          ),
        ),
      ]);
  }

  Client ws() {
    return createClient(
      _env.webSocketBaseUrl,
    );
  }
}
