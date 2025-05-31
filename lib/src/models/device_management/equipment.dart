
import '../models.dart';

class Equipment {
    String? id;
    Site? site;
    ModelDevice? model;
    String? nearonSn;
    String? headUnitSn;
    String? deviceId;
    String? serialNumber;
    String? code;
    int? hm;
    int? km;
    String? engineNo;
    String? engineModel;
    DateTime? purchasedDate;
    String? purchasedStatus;
    String? conditionStatus;
    String? outlineColor;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    Telemetry? telemetry;
    SiteFactorMaterial? siteFactorMaterial;
    InstalledModification? installedModification;
    dynamic siteFactorMaterials;

    Equipment({
        this.id,
        this.site,
        this.model,
        this.nearonSn,
        this.headUnitSn,
        this.deviceId,
        this.serialNumber,
        this.code,
        this.hm,
        this.km,
        this.engineNo,
        this.engineModel,
        this.purchasedDate,
        this.purchasedStatus,
        this.conditionStatus,
        this.outlineColor,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.telemetry,
        this.siteFactorMaterial,
        this.installedModification,
        this.siteFactorMaterials,
    });

    factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
        id: json["id"],
        site: json["site"] == null ? null : Site.fromJson(json["site"]),
        model: json["model"] == null ? null : ModelDevice.fromJson(json["model"]),
        nearonSn: json["nearon_sn"],
        headUnitSn: json["head_unit_sn"],
        deviceId: json["device_id"],
        serialNumber: json["serial_number"],
        code: json["code"],
        hm: json["hm"],
        km: json["km"],
        engineNo: json["engine_no"],
        engineModel: json["engine_model"],
        purchasedDate: json["purchased_date"] == null ? null : DateTime.parse(json["purchased_date"]),
        purchasedStatus: json["purchased_status"],
        conditionStatus: json["condition_status"],
        outlineColor: json["outline_color"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        telemetry: json["telemetry"] == null ? null : Telemetry.fromJson(json["telemetry"]),
        siteFactorMaterial: json["site_factor_material"] == null ? null : SiteFactorMaterial.fromJson(json["site_factor_material"]),
        installedModification: json["installed_modification"] == null ? null : InstalledModification.fromJson(json["installed_modification"]),
        siteFactorMaterials: json["site_factor_materials"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "site": site?.toJson(),
        "model": model?.toJson(),
        "nearon_sn": nearonSn,
        "head_unit_sn": headUnitSn,
        "device_id": deviceId,
        "serial_number": serialNumber,
        "code": code,
        "hm": hm,
        "km": km,
        "engine_no": engineNo,
        "engine_model": engineModel,
        "purchased_date": purchasedDate?.toIso8601String(),
        "purchased_status": purchasedStatus,
        "condition_status": conditionStatus,
        "outline_color": outlineColor,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "telemetry": telemetry?.toJson(),
        "site_factor_material": siteFactorMaterial?.toJson(),
        "installed_modification": installedModification?.toJson(),
        "site_factor_materials": siteFactorMaterials,
    };
}
