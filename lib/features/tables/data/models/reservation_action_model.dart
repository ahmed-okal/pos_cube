// To parse this JSON data, do
//
//     final reservationActionModel = reservationActionModelFromJson(jsonString);

import 'dart:convert';

ReservationActionModel reservationActionModelFromJson(String str) =>
    ReservationActionModel.fromJson(json.decode(str));

String reservationActionModelToJson(ReservationActionModel data) =>
    json.encode(data.toJson());

class ReservationActionModel {
  final int? status;
  final String? message;
  final bool? data;

  ReservationActionModel({
    this.status,
    this.message,
    this.data,
  });

  factory ReservationActionModel.fromJson(Map<String, dynamic> json) =>
      ReservationActionModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
