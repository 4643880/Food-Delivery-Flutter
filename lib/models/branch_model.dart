import 'dart:convert';

class Data {
  Meta? meta;
  List<Datum>? data;

  Data({
    this.meta,
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  String? address;
  dynamic lat;
  dynamic long;
  String? phoneNo;
  List<WorkingHour>? workingHours;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Service>? services;

  Datum({
    this.id,
    this.name,
    this.address,
    this.lat,
    this.long,
    this.phoneNo,
    this.workingHours,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.services,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        lat: json["lat"],
        long: json["long"],
        phoneNo: json["phone_no"],
        workingHours: json["working_hours"] == null
            ? []
            : List<WorkingHour>.from(
                json["working_hours"]!.map((x) => WorkingHour.fromJson(x))),
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "lat": lat,
        "long": long,
        "phone_no": phoneNo,
        "working_hours": workingHours == null
            ? []
            : List<dynamic>.from(workingHours!.map((x) => x.toJson())),
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "services": services == null
            ? []
            : List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  int? id;
  int? branchId;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Service({
    this.id,
    this.branchId,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        branchId: json["branch_id"],
        name: json["name"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branch_id": branchId,
        "name": name,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class WorkingHour {
  String? day;
  Hours? hours;

  WorkingHour({
    this.day,
    this.hours,
  });

  factory WorkingHour.fromJson(Map<String, dynamic> json) => WorkingHour(
        day: json["day"],
        hours: hoursValues.map[json["hours"]]!,
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "hours": hoursValues.reverse[hours],
      };
}

enum Hours { THE_900_AM_500_PM, THE_1000_AM_300_PM, CLOSED }

final hoursValues = EnumValues({
  "Closed": Hours.CLOSED,
  "10:00 AM - 3:00 PM": Hours.THE_1000_AM_300_PM,
  "9:00 AM - 5:00 PM": Hours.THE_900_AM_500_PM
});

class Meta {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  int? firstPage;
  String? firstPageUrl;
  String? lastPageUrl;
  dynamic nextPageUrl;
  dynamic previousPageUrl;

  Meta({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
    this.firstPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.nextPageUrl,
    this.previousPageUrl,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        firstPage: json["first_page"],
        firstPageUrl: json["first_page_url"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        previousPageUrl: json["previous_page_url"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "current_page": currentPage,
        "last_page": lastPage,
        "first_page": firstPage,
        "first_page_url": firstPageUrl,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "previous_page_url": previousPageUrl,
      };
}

class Status {
  bool? success;
  int? code;
  String? message;

  Status({
    this.success,
    this.code,
    this.message,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        success: json["success"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
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
