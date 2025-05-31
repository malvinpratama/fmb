
class InstalledModification {
    String? id;
    String? modification;
    String? description;

    InstalledModification({
        this.id,
        this.modification,
        this.description,
    });

    factory InstalledModification.fromJson(Map<String, dynamic> json) => InstalledModification(
        id: json["id"],
        modification: json["modification"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "modification": modification,
        "description": description,
    };
}
