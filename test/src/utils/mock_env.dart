import 'package:fmb/src/utils/env.dart';

class MockEnv implements Env {
  static const String mockBaseUrl = 'https://mock.api.example.com';
  static const String mockWebSocketBaseUrl = 'wss://mock.ws.example.com';
  static const String mockChannelPrefixUrl = 'channel';

  @override
  String get baseUrl => mockBaseUrl;

  @override
  String get webSocketBaseUrl => mockWebSocketBaseUrl;

  @override
  String get channelPrefixUrl => mockChannelPrefixUrl;
}
