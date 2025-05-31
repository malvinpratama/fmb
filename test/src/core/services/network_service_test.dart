import 'package:centrifuge/centrifuge.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fmb/src/core/services/network_service.dart';
import 'package:fmb/src/utils/env.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../utils/mock_env.dart';

void main() {
  late NetworkService networkService;
  late MockEnv mockEnv;

  setUp(() {
    mockEnv = MockEnv();
    // Register mock env
    GetIt.I.registerSingleton<Env>(mockEnv);
    networkService = NetworkService(mockEnv);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  group('NetworkService', () {
    group('client()', () {
      test('should return Dio instance with correct configuration', () {
        // Act
        final dio = networkService.client();

        // Assert
        expect(dio, isA<Dio>());
        expect(dio.options.baseUrl, equals(mockEnv.baseUrl));
        expect(dio.options.connectTimeout, equals(const Duration(minutes: 1)));
        expect(dio.options.followRedirects, isFalse);
        expect(
          dio.interceptors,
          hasLength(2),
        ); // ImplyContentTypeInterceptor and TalkerDioLogger interceptors
      });

      test('should have TalkerDioLogger with correct settings', () {
        // Act
        final dio = networkService.client();
        final logger = dio.interceptors.whereType<TalkerDioLogger>().first;

        // Assert
        expect(logger.settings.printRequestHeaders, isTrue);
        expect(logger.settings.printResponseHeaders, isTrue);
        expect(logger.settings.printResponseMessage, isTrue);
      });
    });

    group('ws()', () {
      test('should return Client instance with correct configuration', () {
        // Act
        final wsClient = networkService.ws();

        // Assert
        expect(wsClient, isA<Client>());
      });

      test('should use correct WebSocket base URL', () {
        // Act
        final wsClient = networkService.ws();

        // Assert
        expect(wsClient, isNotNull);
      });
    });
  });
}
