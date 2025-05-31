
class Telemetry {
    dynamic totalDistanceTravelled;

    Telemetry({
        this.totalDistanceTravelled,
    });

    factory Telemetry.fromJson(Map<String, dynamic> json) => Telemetry(
        totalDistanceTravelled: json["total_distance_travelled"],
    );

    Map<String, dynamic> toJson() => {
        "total_distance_travelled": totalDistanceTravelled,
    };
}
