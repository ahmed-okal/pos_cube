// To parse this JSON data, do
//
//     final closeSessionModel = closeSessionModelFromJson(jsonString);

import 'dart:convert';

CloseSessionModel closeSessionModelFromJson(String str) =>
    CloseSessionModel.fromJson(json.decode(str));

String closeSessionModelToJson(CloseSessionModel data) =>
    json.encode(data.toJson());

class CloseSessionModel {
  final int? status;
  final String? result;
  final bool? data;

  CloseSessionModel({
    this.status,
    this.result,
    this.data,
  });

  factory CloseSessionModel.fromJson(Map<String, dynamic> json) =>
      CloseSessionModel(
        status: json["status"],
        result: json["result"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "data": data,
      };
}
