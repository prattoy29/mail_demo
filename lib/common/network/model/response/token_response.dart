// To parse this JSON data, do
//
//     final tokenResponse = tokenResponseFromMap(jsonString);

import 'dart:convert';

TokenResponse tokenResponseFromMap(String str) => TokenResponse.fromMap(json.decode(str));

String tokenResponseToMap(TokenResponse data) => json.encode(data.toMap());

class TokenResponse {
  String? token;
  String? id;

  TokenResponse({
    this.token,
    this.id,
  });

  factory TokenResponse.fromMap(Map<String, dynamic> json) => TokenResponse(
    token: json["token"],
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "token": token,
    "id": id,
  };
}
