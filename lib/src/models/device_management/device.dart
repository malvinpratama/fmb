import '../models.dart';

class Device {
    String? id;
    bool? isActive;
    DateTime? activatedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? headUnitSn;
    Equipment? equipment;

    Device({
        this.id,
        this.isActive,
        this.activatedAt,
        this.createdAt,
        this.updatedAt,
        this.headUnitSn,
        this.equipment,
    });

    factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json["id"],
        isActive: json["is_active"],
        activatedAt: json["activated_at"] == null ? null : DateTime.parse(json["activated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        headUnitSn: json["head_unit_sn"],
        equipment: json["equipment"] == null ? null : Equipment.fromJson(json["equipment"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_active": isActive,
        "activated_at": activatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "head_unit_sn": headUnitSn,
        "equipment": equipment?.toJson(),
    };
}
