
import '../models.dart';

class EquipmentCategory {
    String? id;
    String? name;
    bool? isActive;
    bool? isDefault;
    DateTime? createdAt;
    DateTime? updatedAt;
    EquipmentType? equipmentType;

    EquipmentCategory({
        this.id,
        this.name,
        this.isActive,
        this.isDefault,
        this.createdAt,
        this.updatedAt,
        this.equipmentType,
    });

    factory EquipmentCategory.fromJson(Map<String, dynamic> json) => EquipmentCategory(
        id: json["id"],
        name: json["name"],
        isActive: json["is_active"],
        isDefault: json["is_default"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        equipmentType: json["equipment_type"] == null ? null : EquipmentType.fromJson(json["equipment_type"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_active": isActive,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "equipment_type": equipmentType?.toJson(),
    };
}
