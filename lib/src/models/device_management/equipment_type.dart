
class EquipmentType {
    String? id;
    String? name;
    String? code;
    String? iconUrl;
    bool? isActive;
    bool? isDefault;
    dynamic modifications;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? appBackgroundUrl;
    String? appLabel;

    EquipmentType({
        this.id,
        this.name,
        this.code,
        this.iconUrl,
        this.isActive,
        this.isDefault,
        this.modifications,
        this.createdAt,
        this.updatedAt,
        this.appBackgroundUrl,
        this.appLabel,
    });

    factory EquipmentType.fromJson(Map<String, dynamic> json) => EquipmentType(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        iconUrl: json["icon_url"],
        isActive: json["is_active"],
        isDefault: json["is_default"],
        modifications: json["modifications"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        appBackgroundUrl: json["app_background_url"],
        appLabel: json["app_label"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "icon_url": iconUrl,
        "is_active": isActive,
        "is_default": isDefault,
        "modifications": modifications,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "app_background_url": appBackgroundUrl,
        "app_label": appLabel,
    };
}
