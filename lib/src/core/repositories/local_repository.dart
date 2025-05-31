import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core.dart';

@Injectable()
class LocalRepository {
  LocalRepository(this.databaseService);

  final DatabaseService databaseService;

  Future<String?> getStringByKey(String key) async {
    SharedPreferences? db = await databaseService.database;
    return db?.getString(key);
  }

  Future<bool?> setStringByKey(String key, String value) async {
    SharedPreferences? db = await databaseService.database;
    return await db?.setString(key, value);
  }

  Future<bool?> clear() async {
    SharedPreferences? db = await databaseService.database;
    return await db?.clear();
  }
}
