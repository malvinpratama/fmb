import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';
import '../core.dart';

@Injectable()
class LoginRepository {
  LoginRepository(this.networkService);
  final NetworkService networkService;

  Future<BaseResponse<dynamic>?>? loginTabletUnit(
    String nik,
    String shiftId,
  ) async {
    Dio client = networkService.client();
    try {
      final response = await client.post(
        EndPoints.loginTabletUnit,
        data: {
          'unit_id': '90d4eb74d3',
          'nik': nik,
          'shift_id': shiftId,
          'login_type': 1,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      return BaseResponse<UserDevice>.fromJson(
        response.data,
        (json) => UserDevice.fromJson(json),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return BaseResponse<String>.fromJsonString(e.response?.data);
      } else {
        return null;
      }
    }
  }
}
