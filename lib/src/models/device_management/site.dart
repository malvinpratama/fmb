
import '../models.dart';

class Site {
    String? id;
    String? geoJsonUrl;
    String? site;
    String? name;
    String? clientName;
    String? address;
    String? latitude;
    String? longitude;
    bool? isActive;
    bool? isDefault;
    String? wgs;
    DateTime? createdAt;
    DateTime? updatedAt;
    Geojson? geojson;

    Site({
        this.id,
        this.geoJsonUrl,
        this.site,
        this.name,
        this.clientName,
        this.address,
        this.latitude,
        this.longitude,
        this.isActive,
        this.isDefault,
        this.wgs,
        this.createdAt,
        this.updatedAt,
        this.geojson,
    });

    factory Site.fromJson(Map<String, dynamic> json) => Site(
        id: json["id"],
        geoJsonUrl: json["geo_json_url"],
        site: json["site"],
        name: json["name"],
        clientName: json["client_name"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isActive: json["is_active"],
        isDefault: json["is_default"],
        wgs: json["wgs"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        geojson: json["geojson"] == null ? null : Geojson.fromJson(json["geojson"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "geo_json_url": geoJsonUrl,
        "site": site,
        "name": name,
        "client_name": clientName,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "is_active": isActive,
        "is_default": isDefault,
        "wgs": wgs,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "geojson": geojson?.toJson(),
    };
}
