

import '../models.dart';

class RegisterDevices {
    String? id;
    bool? isActive;
    dynamic activatedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? headUnitSn;
    Equipment? equipment;

    RegisterDevices({
        this.id,
        this.isActive,
        this.activatedAt,
        this.createdAt,
        this.updatedAt,
        this.headUnitSn,
        this.equipment,
    });

    factory RegisterDevices.fromJson(Map<String, dynamic> json) => RegisterDevices(
        id: json["id"],
        isActive: json["is_active"],
        activatedAt: json["activated_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        headUnitSn: json["head_unit_sn"],
        equipment: json["equipment"] == null ? null : Equipment.fromJson(json["equipment"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_active": isActive,
        "activated_at": activatedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "head_unit_sn": headUnitSn,
        "equipment": equipment?.toJson(),
    };
}