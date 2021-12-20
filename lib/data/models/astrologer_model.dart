// ignore_for_file: constant_identifier_names
import 'dart:convert';

AstrologerModel astrologerModelFromJson(String str) =>
    AstrologerModel.fromJson(json.decode(str));

String astrologerModelToJson(AstrologerModel data) =>
    json.encode(data.toJson());

class AstrologerModel {
  AstrologerModel({
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
  List<AstrologerModelData>? data;

  factory AstrologerModel.fromJson(Map<String, dynamic> json) =>
      AstrologerModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: List<AstrologerModelData>.from(
            json["data"].map((x) => AstrologerModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": List<dynamic>.from((data ?? []).map((x) => x.toJson())),
      };
}

class AstrologerModelData {
  AstrologerModelData({
    this.id,
    this.urlSlug,
    this.namePrefix,
    this.firstName,
    this.lastName,
    this.aboutMe,
    this.profliePicUrl,
    this.experience,
    this.languages,
    this.minimumCallDuration,
    this.minimumCallDurationCharges,
    this.additionalPerMinuteCharges,
    this.isAvailable,
    this.rating,
    this.skills,
    this.isOnCall,
    this.freeMinutes,
    this.additionalMinute,
    this.images,
    this.availability,
  });

  int? id;
  String? urlSlug;
  String? namePrefix;
  String? firstName;
  String? lastName;
  String? aboutMe;
  dynamic profliePicUrl;
  double? experience;
  List<AstrologerModelLanguage>? languages;
  num? minimumCallDuration;
  double? minimumCallDurationCharges;
  double? additionalPerMinuteCharges;
  bool? isAvailable;
  double? rating;
  List<AstrologerModelSkill>? skills;
  bool? isOnCall;
  int? freeMinutes;
  int? additionalMinute;
  AstrologerModelImages? images;
  AstrologerModelAvailability? availability;

  factory AstrologerModelData.fromJson(Map<String, dynamic> json) =>
      AstrologerModelData(
        id: json["id"],
        urlSlug: json["urlSlug"],
        namePrefix: json["namePrefix"] ?? "",
        firstName: json["firstName"],
        lastName: json["lastName"],
        aboutMe: json["aboutMe"] ?? "",
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"],
        languages: List<AstrologerModelLanguage>.from(
            json["languages"].map((x) => AstrologerModelLanguage.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"],
        minimumCallDurationCharges: json["minimumCallDurationCharges"],
        additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
        isAvailable: json["isAvailable"],
        rating: (json["rating"] ?? 0.0).toDouble(),
        skills: List<AstrologerModelSkill>.from(
            json["skills"].map((x) => AstrologerModelSkill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"],
        additionalMinute: json["additionalMinute"],
        images: AstrologerModelImages.fromJson(json["images"]),
        availability: json["availability"] == null
            ? null
            : AstrologerModelAvailability.fromJson(json["availability"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix ?? "",
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe ?? "",
        "profliePicUrl": profliePicUrl,
        "experience": (experience ?? 0.0).toDouble(),
        "languages": List<dynamic>.from((languages ?? []).map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating ?? 0.0,
        "skills": List<dynamic>.from((skills ?? []).map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images?.toJson(),
        "availability": availability?.toJson(),
      };
}

class AstrologerModelAvailability {
  AstrologerModelAvailability({
    this.days,
    this.slot,
  });

  List<AstrologerModelDay>? days;
  AstrologerModelSlot? slot;

  factory AstrologerModelAvailability.fromJson(Map<String, dynamic> json) =>
      AstrologerModelAvailability(
        days: List<AstrologerModelDay>.from(
            json["days"].map((x) => dayValues.map?[x])),
        slot: AstrologerModelSlot.fromJson(json["slot"]),
      );

  Map<String, dynamic> toJson() => {
        "days":
            List<dynamic>.from((days ?? []).map((x) => dayValues.reverse?[x])),
        "slot": slot?.toJson(),
      };
}

enum AstrologerModelDay { MON, TUE, WED, THU, FRI, SAT, SUN }

final dayValues = EnumValues({
  "FRI": AstrologerModelDay.FRI,
  "MON": AstrologerModelDay.MON,
  "SAT": AstrologerModelDay.SAT,
  "SUN": AstrologerModelDay.SUN,
  "THU": AstrologerModelDay.THU,
  "TUE": AstrologerModelDay.TUE,
  "WED": AstrologerModelDay.WED
});

class AstrologerModelSlot {
  AstrologerModelSlot({
    this.toFormat,
    this.fromFormat,
    this.from,
    this.to,
  });

  AstrologerModelFormat? toFormat;
  AstrologerModelFormat? fromFormat;
  String? from;
  String? to;

  factory AstrologerModelSlot.fromJson(Map<String, dynamic> json) =>
      AstrologerModelSlot(
        toFormat: formatValues.map?[json["toFormat"]],
        fromFormat: formatValues.map?[json["fromFormat"]],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "toFormat": formatValues.reverse?[toFormat],
        "fromFormat": formatValues.reverse?[fromFormat],
        "from": from,
        "to": to,
      };
}

enum AstrologerModelFormat { PM, AM }

final formatValues = EnumValues(
    {"AM": AstrologerModelFormat.AM, "PM": AstrologerModelFormat.PM});

class AstrologerModelImages {
  AstrologerModelImages({
    this.small,
    this.large,
    this.medium,
  });

  AstrologerModelLarge? small;
  AstrologerModelLarge? large;
  AstrologerModelLarge? medium;

  factory AstrologerModelImages.fromJson(Map<String, dynamic> json) =>
      AstrologerModelImages(
        small: AstrologerModelLarge.fromJson(json["small"]),
        large: AstrologerModelLarge.fromJson(json["large"]),
        medium: AstrologerModelLarge.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "small": small?.toJson(),
        "large": large?.toJson(),
        "medium": medium?.toJson(),
      };
}

class AstrologerModelLarge {
  AstrologerModelLarge({
    this.imageUrl,
    this.id,
  });

  String? imageUrl;
  int? id;

  factory AstrologerModelLarge.fromJson(Map<String, dynamic> json) =>
      AstrologerModelLarge(
        imageUrl: json["imageUrl"],
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl ?? "",
        "id": id ?? 0,
      };
}

class AstrologerModelLanguage {
  AstrologerModelLanguage({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory AstrologerModelLanguage.fromJson(Map<String, dynamic> json) =>
      AstrologerModelLanguage(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

//enum LanguageName { HINDI, ENGLISH }

// final languageNameValues =
//     EnumValues({"English": LanguageName.ENGLISH, "Hindi": LanguageName.HINDI});

class AstrologerModelSkill {
  AstrologerModelSkill({
    this.id,
    this.name,
    this.description,
  });

  int? id;
  String? name;
  String? description;

  factory AstrologerModelSkill.fromJson(Map<String, dynamic> json) =>
      AstrologerModelSkill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

enum SkillName {
  VEDIC_ASTROLOGY,
  VASTU,
  ASTROLOGY,
  NUMEROLOGY,
  COFFE_CUP_READING,
  FALIT_JYOTISH,
  KUNDALI_GRAH_DOSH,
  PALMISTRY,
  TAROT,
  FACE_READING
}

final skillNameValues = EnumValues({
  "Astrology": SkillName.ASTROLOGY,
  "Coffe Cup Reading": SkillName.COFFE_CUP_READING,
  "Face Reading": SkillName.FACE_READING,
  "Falit Jyotish": SkillName.FALIT_JYOTISH,
  "Kundali Grah Dosh": SkillName.KUNDALI_GRAH_DOSH,
  "Numerology": SkillName.NUMEROLOGY,
  "Palmistry": SkillName.PALMISTRY,
  "Tarot": SkillName.TAROT,
  "Vastu": SkillName.VASTU,
  "Vedic Astrology": SkillName.VEDIC_ASTROLOGY
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
