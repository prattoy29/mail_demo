import 'dart:convert';

GetCityEntity getCitiesFromJson(String str) =>
    GetCityEntity.fromJson(json.decode(str));

class GetCityEntity {
  GetCityEntity({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,
    required this.country,

  });

  int id = 0;
  String name = "";
  String created = "";
  String updated = "";
  int country = 0;


  factory GetCityEntity.fromJson(Map<String, dynamic> json) => GetCityEntity(
    id: json["id"],
    name: json["name"],
    created: json["created"],
    updated: json["updated"],
    country: json["country"],
  );
}
