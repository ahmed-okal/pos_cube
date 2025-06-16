// To parse this JSON data, do
//
//     final generateSessionModel = generateSessionModelFromJson(jsonString);

import 'dart:convert';

GenerateSessionModel generateSessionModelFromJson(String str) =>
    GenerateSessionModel.fromJson(json.decode(str));

String generateSessionModelToJson(GenerateSessionModel data) =>
    json.encode(data.toJson());

class GenerateSessionModel {
  final int? status;
  final String? result;
  final Data? data;

  GenerateSessionModel({
    this.status,
    this.result,
    this.data,
  });

  factory GenerateSessionModel.fromJson(Map<String, dynamic> json) =>
      GenerateSessionModel(
        status: json["status"],
        result: json["result"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "data": data?.toJson(),
      };
}

class Data {
  final String? sessionCode;

  Data({
    this.sessionCode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sessionCode: json["session_code"],
      );

  Map<String, dynamic> toJson() => {
        "session_code": sessionCode,
      };
}
