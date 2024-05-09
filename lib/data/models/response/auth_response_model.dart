import 'dart:convert';

class AuthResponseModel {
  final String? status;
  final String? message;
  final Data? data;
  final String? token;

  AuthResponseModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data?.toMap(),
        "token": token,
      };
}

class Data {
  final String? redirectTo;

  Data({
    this.redirectTo,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        redirectTo: json["redirectTo"],
      );

  Map<String, dynamic> toMap() => {
        "redirectTo": redirectTo,
      };
}
