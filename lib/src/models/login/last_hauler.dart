
class LastHauler {
    String haulerId;
    String code;
    String operatorHaulerId;

    LastHauler({
        required this.haulerId,
        required this.code,
        required this.operatorHaulerId,
    });

    factory LastHauler.fromJson(Map<String, dynamic> json) => LastHauler(
        haulerId: json["hauler_id"],
        code: json["code"],
        operatorHaulerId: json["operator_hauler_id"],
    );

    Map<String, dynamic> toJson() => {
        "hauler_id": haulerId,
        "code": code,
        "operator_hauler_id": operatorHaulerId,
    };
}
