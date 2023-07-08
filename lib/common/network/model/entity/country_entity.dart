import 'dart:convert';

GetCountryEntity getCountriesFromJson(String str) =>
    GetCountryEntity.fromJson(json.decode(str));

class GetCountryEntity {
  GetCountryEntity({
    required this.id,
    required this.name,
    required this.created,
    required this.updated,

  });

  int id = 0;
  String name = "";
  String created = "";
  String updated = "";


  factory GetCountryEntity.fromJson(Map<String, dynamic> json) => GetCountryEntity(
    id: json["id"],
    name: json["name"],
    created: json["created"],
    updated: json["updated"],
  );
}
