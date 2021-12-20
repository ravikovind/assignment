import 'dart:convert';

LoctionApiModel loctionApiModelFromJson(String str) =>
    LoctionApiModel.fromJson(json.decode(str));

String loctionApiModelToJson(LoctionApiModel data) =>
    json.encode(data.toJson());

class LoctionApiModel {
  LoctionApiModel({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  List<LoctionApiModelData>? data;

  factory LoctionApiModel.fromJson(Map<String, dynamic> json) =>
      LoctionApiModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: json["data"] == null
            ? []
            : List<LoctionApiModelData>.from(
                json["data"].map((x) => LoctionApiModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": List<dynamic>.from(data ?? [].map((x) => x.toJson())),
      };
}

class LoctionApiModelData {
  LoctionApiModelData({
    this.placeName,
    this.placeId,
  });

  String? placeName;
  String? placeId;

  factory LoctionApiModelData.fromJson(Map<String, dynamic> json) =>
      LoctionApiModelData(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
