import 'dart:convert';

TokenEntity getTokensFromJson(String str) =>
    TokenEntity.fromJson(json.decode(str));

class TokenEntity {
  TokenEntity({
    this.refresh,
    this.access,
  });

  String? refresh = "";
  String? access = "";

  factory TokenEntity.fromJson(Map<String, dynamic> json) => TokenEntity(
        refresh: json["refresh"],
        access: json["access"],
      );
}
