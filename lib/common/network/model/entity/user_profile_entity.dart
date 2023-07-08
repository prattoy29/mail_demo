import 'dart:convert';

UserProfileEntity getUserProfileFromJson(String str) =>
    UserProfileEntity.fromJson(json.decode(str));

class UserProfileEntity {
  UserProfileEntity({
    this.id,
    this.first_name,
    this.middle_name,
    this.last_name,
    this.nationality,
    this.date_of_birth,
    this.gender,
    this.promo_code,
  });

  int? id = 0;
  String? first_name = "";
  String? middle_name = "";
  String? last_name = "";
  String? nationality = "";
  String? date_of_birth = "";
  int? gender = 0;
  String? promo_code = "";

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) => UserProfileEntity(
    id: json["id"],
    first_name: json["first_name"],
    middle_name: json["middle_name"],
    last_name: json["last_name"],
    nationality: json["nationality"],
    date_of_birth: json["date_of_birth"]??" ",
    gender: json["gender"],
    promo_code: json["promo_code"],
  );


  Map<String?, dynamic> toJson() => {
    "first_name": first_name == null ? null : first_name,
    "middle_name": middle_name == null ? null : middle_name,
    "last_name": last_name == null ? null : last_name,
    "nationality": nationality == null ? null : nationality,
    "date_of_birth": date_of_birth == null ? null : date_of_birth,
    "gender": gender == null ? null : gender,
    "promo_code": promo_code == null ? null : promo_code,
  };


}
