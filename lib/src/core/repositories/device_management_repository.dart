import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../core.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

@Injectable()
class DeviceManagementRepository {
  DeviceManagementRepository(this.networkService, this.env);
  final NetworkService networkService;
  final Env env;

  Future<BaseResponse<dynamic>?> getDeviceId(String deviceId) async {
    Dio client = networkService.client();
    try {
      final response = await client.get(
        "${EndPoints.equipmentsDevices}/$deviceId",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      return BaseResponse<Device>.fromJson(
        response.data,
        (json) => Device.fromJson(json),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return BaseResponse<String>.fromJsonString(e.response?.data);
      } else {
        return null;
      }
    }
  }

  Future<BaseResponse<dynamic>?> registerDevice(
    String deviceId,
    String serialNumber,
  ) async {
    Dio client = networkService.client();
    try {
      final response = await client.post(
        EndPoints.equipmentsDevices,
        data: {'id': deviceId, 'head_unit_sn': serialNumber},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      return BaseResponse<Device>.fromJson(
        response.data,
        (json) => Device.fromJson(json),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        return BaseResponse<String>.fromJsonString(e.response?.data);
      } else {
        return null;
      }
    }
  }

  subscribeDevice(String deviceId, Function(Device) callback) async {
    final ws = networkService.ws();

    await ws.connect();

    final subscription = ws.getSubscription(
      env.channelPrefixUrl +
          EndPoints.wsEquipmentsDevicesDeviceIdActivated(deviceId),
    );

    subscription.publishStream.listen((event) {
      debugPrint("WebSocket Event: $event");
      final data = jsonDecode(utf8.decode(event.data));
      final userDevice = Device.fromJson(data);
      callback(userDevice);
    });
    await subscription.subscribe();
  }

  onEvent(dynamic event) {
    debugPrint("WebSocket Event: $event");
  }
}
