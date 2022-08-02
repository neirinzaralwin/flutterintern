// To parse this JSON data, do
//
//     final bearer = bearerFromJson(jsonString);

import 'dart:convert';

Bearer bearerFromJson(String str) => Bearer.fromJson(json.decode(str));

String bearerToJson(Bearer data) => json.encode(data.toJson());

class Bearer {
  final String tokenType;
  final String accessToken;

  Bearer({
    required this.tokenType,
    required this.accessToken,
  });

  factory Bearer.fromJson(Map<String, dynamic> json) => Bearer(
        tokenType: json["token_type"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "access_token": accessToken,
      };
}
