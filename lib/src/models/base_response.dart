
class BaseResponse<T> {
  int? code;
  bool? status;
  String? message;
  T? data;

  BaseResponse({this.code, this.status, this.message, this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> response,
    T Function(Map<String, dynamic> json) onData,
  ) => BaseResponse(
    code: response["code"],
    status: response["status"],
    message: response["message"],
    data: onData(response["data"] ?? {}),
  );

  factory BaseResponse.fromJsonString(
    Map<String, dynamic> response,
  ) => BaseResponse(
    code: response["code"],
    status: response["status"],
    message: response["message"],
    data: response["data"],
  );

  Map<String, dynamic> toJson({
    required Map<String, dynamic> Function(T? data) dataToJson,
  }) => {
    "code": code,
    "status": status,
    "message": message,
    "data": dataToJson(data),
  };
}
