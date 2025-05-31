import 'package:injectable/injectable.dart';

@Injectable()
class WelcomeBackUsecase {
  
  Stream<double> getIncrementalValue() async* {
    double value = 0.0;
    while (value <= 1.0) {
      yield value;
      await Future.delayed(const Duration(seconds: 1));
      value += 0.2;
      // Round to 1 decimal place to avoid floating point precision issues
      value = double.parse(value.toStringAsFixed(1));
    }
  }
}