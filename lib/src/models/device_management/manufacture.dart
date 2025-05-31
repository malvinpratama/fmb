
class Manufacture {
    String? id;
    String? code;
    String? name;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? modelCount;
    String? type;
    String? system;

    Manufacture({
        this.id,
        this.code,
        this.name,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.modelCount,
        this.type,
        this.system,
    });

    factory Manufacture.fromJson(Map<String, dynamic> json) => Manufacture(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        modelCount: json["model_count"],
        type: json["type"],
        system: json["system"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "model_count": modelCount,
        "type": type,
        "system": system,
    };
}
