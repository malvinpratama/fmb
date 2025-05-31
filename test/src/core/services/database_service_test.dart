import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fmb/src/core/services/database_service.dart';

void main() {
  late DatabaseService databaseService;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    databaseService = DatabaseService();
  });

  group('DatabaseService', () {
    test('database getter returns SharedPreferences instance', () async {
      // Act
      final result = await databaseService.database;

      // Assert
      expect(result, isA<SharedPreferences>());
    });

    test('database is singleton - returns same instance', () async {
      // Act
      final firstCall = await databaseService.database;
      final secondCall = await databaseService.database;

      // Assert
      expect(firstCall, equals(secondCall));
    });

    test('database is initialized only once', () async {
      // Act
      final firstCall = await databaseService.database;
      
      // Modify a value in the first instance
      await firstCall?.setString('test_key', 'test_value');
      
      final secondCall = await databaseService.database;
      
      // Assert
      // The second call should have the same data as it's the same instance
      expect(secondCall?.getString('test_key'), equals('test_value'));
    });
  });
}