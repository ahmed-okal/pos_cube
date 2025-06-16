import 'dart:convert';

AvailableReservationModel availableReservationModelFromJson(String str) =>
    AvailableReservationModel.fromJson(json.decode(str));

String availableReservationModelToJson(AvailableReservationModel data) =>
    json.encode(data.toJson());

class AvailableReservationModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  AvailableReservationModel({
    this.status,
    this.message,
    this.data,
  });

  factory AvailableReservationModel.fromJson(Map<String, dynamic> json) =>
      AvailableReservationModel(
        status: json["status"] as int?,
        message: json["message"] as String?,
        data: (json["data"] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.map((e) => e.toJson()).toList(),
      };
}

class Datum {
  final TableDetails? tableDetails;
  final List<String>? slotsPeriod; // always a list of strings
  final List<SlotClass>? slots; // flattened list of SlotClass

  Datum({
    this.tableDetails,
    this.slotsPeriod,
    this.slots,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    // normalize slots_period to List<String>
    List<String> periodList = [];
    final sp = json["slots_period"];
    if (sp is String) {
      periodList = [sp];
    } else if (sp is List) {
      periodList = sp.map((e) => e.toString()).toList();
    }

    // normalize slots to List<SlotClass>
    final rawSlots = json["slots"];
    List<SlotClass> slotList = [];
    if (rawSlots is List) {
      if (rawSlots.isNotEmpty && rawSlots.first is List) {
        // nested list case
        slotList = (rawSlots.first as List)
            .cast<Map<String, dynamic>>()
            .map((e) => SlotClass.fromJson(e))
            .toList();
      } else {
        slotList = rawSlots
            .cast<Map<String, dynamic>>()
            .map((e) => SlotClass.fromJson(e))
            .toList();
      }
    }

    return Datum(
      tableDetails: json["table_details"] == null
          ? null
          : TableDetails.fromJson(
              json["table_details"] as Map<String, dynamic>),
      slotsPeriod: periodList,
      slots: slotList,
    );
  }

  Map<String, dynamic> toJson() => {
        "table_details": tableDetails?.toJson(),
        "slots_period": slotsPeriod,
        "slots": slots?.map((e) => e.toJson()).toList(),
      };
}

class SlotClass {
  final String? slotStartTime;
  final String? slotEndTime;

  SlotClass({
    this.slotStartTime,
    this.slotEndTime,
  });

  factory SlotClass.fromJson(Map<String, dynamic> json) => SlotClass(
        slotStartTime: json["slot_start_time"] as String?,
        slotEndTime: json["slot_end_time"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "slot_start_time": slotStartTime,
        "slot_end_time": slotEndTime,
      };
}

class TableDetails {
  final int? id;
  final String? tableCode;
  final int? noOfSeats;
  final int? status;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? tablePlaceId;

  TableDetails({
    this.id,
    this.tableCode,
    this.noOfSeats,
    this.status,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.tablePlaceId,
  });

  factory TableDetails.fromJson(Map<String, dynamic> json) => TableDetails(
        id: json["id"] as int?,
        tableCode: json["table_code"] as String?,
        noOfSeats: json["no_of_seats"] as int?,
        status: json["status"] as int?,
        tenantId: json["tenant_id"] as String?,
        companyId: json["company_id"] as String?,
        branchId: json["branch_id"] as String?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"] as String),
        tablePlaceId: json["table_place_id"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "table_code": tableCode,
        "no_of_seats": noOfSeats,
        "status": status,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "table_place_id": tablePlaceId,
      };
}
