
class Last {
    String id;
    String name;

    Last({
        required this.id,
        required this.name,
    });

    factory Last.fromJson(Map<String, dynamic> json) => Last(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}