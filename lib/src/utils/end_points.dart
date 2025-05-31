class EndPoints {
  static const String equipmentsDevices = '/equipments/devices';

  static String wsEquipmentsDevicesDeviceIdActivated(String deviceId) =>
      '/equipments/devices/$deviceId/activated';

  static String loginTabletUnit = '/login-tablet-unit';
}
