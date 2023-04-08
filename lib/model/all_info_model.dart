import 'dart:convert';

AllInfoModel allInfoModelFromJson(String str) => AllInfoModel.fromJson(json.decode(str));

String allInfoModelToJson(AllInfoModel data) => json.encode(data.toJson());

class AllInfoModel {
    AllInfoModel({
        required this.links,
        required this.elementCount,
        required this.nearEarthObjects,
    });

    AllInfoModelLinks links;
    int elementCount;
    Map<String, List<NearEarthObject>> nearEarthObjects;

    factory AllInfoModel.fromJson(Map<String, dynamic> json) => AllInfoModel(
        links: AllInfoModelLinks.fromJson(json["links"]),
        elementCount: json["element_count"],
        nearEarthObjects: Map.from(json["near_earth_objects"]).map((k, v) => MapEntry<String, List<NearEarthObject>>(k, List<NearEarthObject>.from(v.map((x) => NearEarthObject.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "links": links.toJson(),
        "element_count": elementCount,
        "near_earth_objects": Map.from(nearEarthObjects).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    };
}

class AllInfoModelLinks {
    AllInfoModelLinks({
        required this.next,
        required this.previous,
        required this.self,
    });

    String next;
    String previous;
    String self;

    factory AllInfoModelLinks.fromJson(Map<String, dynamic> json) => AllInfoModelLinks(
        next: json["next"],
        previous: json["previous"],
        self: json["self"],
    );

    Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
        "self": self,
    };
}

class NearEarthObject {
    NearEarthObject({
        required this.links,
        required this.id,
        required this.neoReferenceId,
        required this.name,
        required this.nasaJplUrl,
        required this.absoluteMagnitudeH,
        required this.estimatedDiameter,
        required this.isPotentiallyHazardousAsteroid,
        required this.closeApproachData,
        required this.isSentryObject,
    });

    NearEarthObjectLinks links;
    String id;
    String neoReferenceId;
    String name;
    String nasaJplUrl;
    double absoluteMagnitudeH;
    EstimatedDiameter estimatedDiameter;
    bool isPotentiallyHazardousAsteroid;
    List<CloseApproachDatum> closeApproachData;
    bool isSentryObject;

    factory NearEarthObject.fromJson(Map<String, dynamic> json) => NearEarthObject(
        links: NearEarthObjectLinks.fromJson(json["links"]),
        id: json["id"],
        neoReferenceId: json["neo_reference_id"],
        name: json["name"],
        nasaJplUrl: json["nasa_jpl_url"],
        absoluteMagnitudeH: json["absolute_magnitude_h"]?.toDouble(),
        estimatedDiameter: EstimatedDiameter.fromJson(json["estimated_diameter"]),
        isPotentiallyHazardousAsteroid: json["is_potentially_hazardous_asteroid"],
        closeApproachData: List<CloseApproachDatum>.from(json["close_approach_data"].map((x) => CloseApproachDatum.fromJson(x))),
        isSentryObject: json["is_sentry_object"],
    );

    Map<String, dynamic> toJson() => {
        "links": links.toJson(),
        "id": id,
        "neo_reference_id": neoReferenceId,
        "name": name,
        "nasa_jpl_url": nasaJplUrl,
        "absolute_magnitude_h": absoluteMagnitudeH,
        "estimated_diameter": estimatedDiameter.toJson(),
        "is_potentially_hazardous_asteroid": isPotentiallyHazardousAsteroid,
        "close_approach_data": List<dynamic>.from(closeApproachData.map((x) => x.toJson())),
        "is_sentry_object": isSentryObject,
    };
}

class CloseApproachDatum {
    CloseApproachDatum({
        required this.closeApproachDate,
        required this.closeApproachDateFull,
        required this.epochDateCloseApproach,
        required this.relativeVelocity,
        required this.missDistance,
        required this.orbitingBody,
    });

    DateTime closeApproachDate;
    String closeApproachDateFull;
    int epochDateCloseApproach;
    RelativeVelocity relativeVelocity;
    MissDistance missDistance;
    OrbitingBody orbitingBody;

    factory CloseApproachDatum.fromJson(Map<String, dynamic> json) => CloseApproachDatum(
        closeApproachDate: DateTime.parse(json["close_approach_date"]),
        closeApproachDateFull: json["close_approach_date_full"],
        epochDateCloseApproach: json["epoch_date_close_approach"],
        relativeVelocity: RelativeVelocity.fromJson(json["relative_velocity"]),
        missDistance: MissDistance.fromJson(json["miss_distance"]),
        orbitingBody: orbitingBodyValues.map[json["orbiting_body"]]!,
    );

    Map<String, dynamic> toJson() => {
        "close_approach_date": "${closeApproachDate.year.toString().padLeft(4, '0')}-${closeApproachDate.month.toString().padLeft(2, '0')}-${closeApproachDate.day.toString().padLeft(2, '0')}",
        "close_approach_date_full": closeApproachDateFull,
        "epoch_date_close_approach": epochDateCloseApproach,
        "relative_velocity": relativeVelocity.toJson(),
        "miss_distance": missDistance.toJson(),
        "orbiting_body": orbitingBodyValues.reverse[orbitingBody],
    };
}

class MissDistance {
    MissDistance({
        required this.astronomical,
        required this.lunar,
        required this.kilometers,
        required this.miles,
    });

    String astronomical;
    String lunar;
    String kilometers;
    String miles;

    factory MissDistance.fromJson(Map<String, dynamic> json) => MissDistance(
        astronomical: json["astronomical"],
        lunar: json["lunar"],
        kilometers: json["kilometers"],
        miles: json["miles"],
    );

    Map<String, dynamic> toJson() => {
        "astronomical": astronomical,
        "lunar": lunar,
        "kilometers": kilometers,
        "miles": miles,
    };
}

enum OrbitingBody { EARTH }

final orbitingBodyValues = EnumValues({
    "Earth": OrbitingBody.EARTH
});

class RelativeVelocity {
    RelativeVelocity({
        required this.kilometersPerSecond,
        required this.kilometersPerHour,
        required this.milesPerHour,
    });

    String kilometersPerSecond;
    String kilometersPerHour;
    String milesPerHour;

    factory RelativeVelocity.fromJson(Map<String, dynamic> json) => RelativeVelocity(
        kilometersPerSecond: json["kilometers_per_second"],
        kilometersPerHour: json["kilometers_per_hour"],
        milesPerHour: json["miles_per_hour"],
    );

    Map<String, dynamic> toJson() => {
        "kilometers_per_second": kilometersPerSecond,
        "kilometers_per_hour": kilometersPerHour,
        "miles_per_hour": milesPerHour,
    };
}

class EstimatedDiameter {
    EstimatedDiameter({
        required this.kilometers,
        required this.meters,
        required this.miles,
        required this.feet,
    });

    Feet kilometers;
    Feet meters;
    Feet miles;
    Feet feet;

    factory EstimatedDiameter.fromJson(Map<String, dynamic> json) => EstimatedDiameter(
        kilometers: Feet.fromJson(json["kilometers"]),
        meters: Feet.fromJson(json["meters"]),
        miles: Feet.fromJson(json["miles"]),
        feet: Feet.fromJson(json["feet"]),
    );

    Map<String, dynamic> toJson() => {
        "kilometers": kilometers.toJson(),
        "meters": meters.toJson(),
        "miles": miles.toJson(),
        "feet": feet.toJson(),
    };
}

class Feet {
    Feet({
        required this.estimatedDiameterMin,
        required this.estimatedDiameterMax,
    });

    double estimatedDiameterMin;
    double estimatedDiameterMax;

    factory Feet.fromJson(Map<String, dynamic> json) => Feet(
        estimatedDiameterMin: json["estimated_diameter_min"]?.toDouble(),
        estimatedDiameterMax: json["estimated_diameter_max"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "estimated_diameter_min": estimatedDiameterMin,
        "estimated_diameter_max": estimatedDiameterMax,
    };
}

class NearEarthObjectLinks {
    NearEarthObjectLinks({
        required this.self,
    });

    String self;

    factory NearEarthObjectLinks.fromJson(Map<String, dynamic> json) => NearEarthObjectLinks(
        self: json["self"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
