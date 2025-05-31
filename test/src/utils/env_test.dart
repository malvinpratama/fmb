import 'package:flutter_test/flutter_test.dart';
import 'mock_env.dart';

void main() {
  group('MockEnv', () {
    late MockEnv mockEnv;

    setUp(() {
      mockEnv = MockEnv();
    });

    test('should return mock base URL', () {
      expect(mockEnv.baseUrl, equals(MockEnv.mockBaseUrl));
    });

    test('should return mock websocket base URL', () {
      expect(mockEnv.webSocketBaseUrl, equals(MockEnv.mockWebSocketBaseUrl));
    });

    test('should return mock channel prefix URL', () {
      expect(mockEnv.channelPrefixUrl, equals(MockEnv.mockChannelPrefixUrl));
    });
  });
}
