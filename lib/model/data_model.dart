import 'package:get/get.dart';

class DataModel {
  DataModel({
    this.currentBookings,
    this.packages,
  });

  CurrentBookings? currentBookings;
  List<Package>? packages;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        currentBookings: json["current_bookings"] == null
            ? null
            : CurrentBookings.fromJson(json["current_bookings"]),
        packages: json["packages"] == null
            ? <Package>[]
            : List<Package>.from(
                json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_bookings":
            currentBookings == null ? null : currentBookings!.toJson(),
        "packages": packages == null
            ? null
            : List<dynamic>.from(packages!.map((x) => x.toJson())),
      };
}

class CurrentBookings {
  CurrentBookings({
    this.packageLabel,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
  });

  String? packageLabel;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  factory CurrentBookings.fromJson(Map<String, dynamic> json) =>
      CurrentBookings(
        packageLabel: json["package_label"] ?? '',
        fromDate: json["from_date"] ?? '',
        fromTime: json["from_time"] ?? '',
        toDate: json["to_date"] ?? '',
        toTime: json["to_time"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "package_label": packageLabel ?? '',
        "from_date": fromDate ?? '',
        "from_time": fromTime ?? '',
        "to_date": toDate ?? '',
        "to_time": toTime ?? '',
      };
}

class Package {
  Package({
    this.id,
    this.packageName,
    this.price,
    this.more,
    this.description,
  });

  int? id;
  String? packageName;
  int? price;
  String? description;
  RxBool? more;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"] ?? '',
        packageName: json["package_name"] ?? '',
        price: json["price"] ?? '',
        description: json["description"] ?? '',
        more: false.obs,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_name": packageName,
        "price": price,
        "description": description,
      };
}
