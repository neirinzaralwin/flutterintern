import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.data,
  });

  final Data data;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.duty,
    required this.warehouse,
    required this.roles,
    required this.orderCreatePermission,
    required this.skipApprovalPermission,
  });

  final String name;
  final String username;
  final dynamic email;
  final String phone;
  final String duty;
  final String warehouse;
  final List<String> roles;
  final bool orderCreatePermission;
  final bool skipApprovalPermission;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        duty: json["duty"],
        warehouse: json["warehouse"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        orderCreatePermission: json["order_create_permission"],
        skipApprovalPermission: json["skip_approval_permission"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "email": email,
        "phone": phone,
        "duty": duty,
        "warehouse": warehouse,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "order_create_permission": orderCreatePermission,
        "skip_approval_permission": skipApprovalPermission,
      };
}
