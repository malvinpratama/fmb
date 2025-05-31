import 'package:injectable/injectable.dart';

@LazySingleton()
class Env {
  final String baseUrl = const String.fromEnvironment('baseUrl');
  final String webSocketBaseUrl = const String.fromEnvironment(
    'webSocketBaseUrl',
  );
  final String channelPrefixUrl = const String.fromEnvironment(
    'channelPrefixUrl',
  );
}
