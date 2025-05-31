import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fmb/src/core/services/database_service.dart';
import 'package:fmb/src/core/repositories/local_repository.dart';

import 'local_repository_test.mocks.dart';

@GenerateMocks([DatabaseService])
void main() {
  late LocalRepository localRepository;
  late MockDatabaseService mockDatabaseService;
  late SharedPreferences sharedPreferences;

  setUp(() async {
    mockDatabaseService = MockDatabaseService();
    localRepository = LocalRepository(mockDatabaseService);
    SharedPreferences.setMockInitialValues({});
    sharedPreferences = await SharedPreferences.getInstance();
    when(mockDatabaseService.database).thenAnswer((_) async => sharedPreferences);
  });

  group('LocalRepository', () {
    test('getStringByKey returns correct value', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';
      await sharedPreferences.setString(key, value);

      // Act
      final result = await localRepository.getStringByKey(key);

      // Assert
      expect(result, equals(value));
      verify(mockDatabaseService.database).called(1);
    });

    test('setStringByKey stores value correctly', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';

      // Act
      final result = await localRepository.setStringByKey(key, value);

      // Assert
      expect(result, isTrue);
      expect(sharedPreferences.getString(key), equals(value));
      verify(mockDatabaseService.database).called(1);
    });

    test('clear removes all values', () async {
      // Arrange
      await sharedPreferences.setString('key1', 'value1');
      await sharedPreferences.setString('key2', 'value2');

      // Act
      final result = await localRepository.clear();

      // Assert
      expect(result, isTrue);
      expect(sharedPreferences.getString('key1'), isNull);
      expect(sharedPreferences.getString('key2'), isNull);
      verify(mockDatabaseService.database).called(1);
    });
  });
}