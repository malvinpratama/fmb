
class LastLoader {
    String loaderId;
    String code;
    String operatorLoaderId;

    LastLoader({
        required this.loaderId,
        required this.code,
        required this.operatorLoaderId,
    });

    factory LastLoader.fromJson(Map<String, dynamic> json) => LastLoader(
        loaderId: json["loader_id"],
        code: json["code"],
        operatorLoaderId: json["operator_loader_id"],
    );

    Map<String, dynamic> toJson() => {
        "loader_id": loaderId,
        "code": code,
        "operator_loader_id": operatorLoaderId,
    };
}