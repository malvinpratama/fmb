
class ClassDevice {
    String? id;
    String? name;

    ClassDevice({
        this.id,
        this.name,
    });

    factory ClassDevice.fromJson(Map<String, dynamic> json) => ClassDevice(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}