
class SiteFactorMaterial {
    int? factorMaterial;
    String? materialId;
    String? materialName;
    String? measurementId;
    String? measurementName;

    SiteFactorMaterial({
        this.factorMaterial,
        this.materialId,
        this.materialName,
        this.measurementId,
        this.measurementName,
    });

    factory SiteFactorMaterial.fromJson(Map<String, dynamic> json) => SiteFactorMaterial(
        factorMaterial: json["factor_material"],
        materialId: json["material_id"],
        materialName: json["material_name"],
        measurementId: json["measurement_id"],
        measurementName: json["measurement_name"],
    );

    Map<String, dynamic> toJson() => {
        "factor_material": factorMaterial,
        "material_id": materialId,
        "material_name": materialName,
        "measurement_id": measurementId,
        "measurement_name": measurementName,
    };
}