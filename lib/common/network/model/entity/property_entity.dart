import 'dart:convert';

GetHotelEntity getHotelsFromJson(String str) =>
    GetHotelEntity.fromJson(json.decode(str));

class GetHotelEntity {
  GetHotelEntity({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.title,
    required this.description,
    required this.cheapestPrice,

  });

  int id = 0;
  String name = "";
  String city = "";
  String address = "";
  String description = "";
  String cheapestPrice = "";
  int title = 0;


  factory GetHotelEntity.fromJson(Map<String, dynamic> json) => GetHotelEntity(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    address: json["address"],
    description: json["description"],
    cheapestPrice: json["cheapestPrice"],
    title: json["title"],
  );
}
