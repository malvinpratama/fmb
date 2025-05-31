
class Geojson {
    String? fileName;
    List<dynamic>? coordinates;

    Geojson({
        this.fileName,
        this.coordinates,
    });

    factory Geojson.fromJson(Map<String, dynamic> json) => Geojson(
        fileName: json["file_name"],
        coordinates: json["coordinates"] == null ? [] : List<dynamic>.from(json["coordinates"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "file_name": fileName,
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}
