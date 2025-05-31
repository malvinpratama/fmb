import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class DatabaseService {
  SharedPreferences? _database;

  Future<SharedPreferences?> get database async {
    _database ??= await SharedPreferences.getInstance();
    return _database!;
  }
}
