import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@LazySingleton()
class LoggerService {
   Talker? _talker;

   Talker get talker {
    _talker ??= TalkerFlutter.init();
   
    return _talker!;
  }
}
