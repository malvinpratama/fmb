
import '../models.dart';

class ModelDevice {
    String? id;
    String? no;
    String? name;
    int? capacity;
    dynamic radiusMeters;
    bool? isTyre;
    String? tyreClass;
    bool? isActive;
    ClassDevice? modelClass;
    ClassDevice? measurement;
    Manufacture? manufacture;
    EquipmentCategory? equipmentCategory;
    DateTime? createdAt;
    DateTime? updatedAt;

    ModelDevice({
        this.id,
        this.no,
        this.name,
        this.capacity,
        this.radiusMeters,
        this.isTyre,
        this.tyreClass,
        this.isActive,
        this.modelClass,
        this.measurement,
        this.manufacture,
        this.equipmentCategory,
        this.createdAt,
        this.updatedAt,
    });

    factory ModelDevice.fromJson(Map<String, dynamic> json) => ModelDevice(
        id: json["id"],
        no: json["no"],
        name: json["name"],
        capacity: json["capacity"],
        radiusMeters: json["radius_meters"],
        isTyre: json["is_tyre"],
        tyreClass: json["tyre_class"],
        isActive: json["is_active"],
        modelClass: json["class"] == null ? null : ClassDevice.fromJson(json["class"]),
        measurement: json["measurement"] == null ? null : ClassDevice.fromJson(json["measurement"]),
        manufacture: json["manufacture"] == null ? null : Manufacture.fromJson(json["manufacture"]),
        equipmentCategory: json["equipment_category"] == null ? null : EquipmentCategory.fromJson(json["equipment_category"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "name": name,
        "capacity": capacity,
        "radius_meters": radiusMeters,
        "is_tyre": isTyre,
        "tyre_class": tyreClass,
        "is_active": isActive,
        "class": modelClass?.toJson(),
        "measurement": measurement?.toJson(),
        "manufacture": manufacture?.toJson(),
        "equipment_category": equipmentCategory?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
