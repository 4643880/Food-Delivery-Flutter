import 'package:hive/hive.dart';

part 'user_model.g.dart'; // this will generate models
// then use this command in terminal => flutter packages pub run build_runner build
// above command will automatically generate adapter of the new model
// flutter_hive provides listenable to show in real time

class UserModel {
  String? cookie;
  int? userId;
  String? cookieName;
  User? user;
  dynamic message;
  int? statusCode;
  bool? success;

  UserModel({
    this.cookie,
    this.userId,
    this.cookieName,
    this.user,
    this.message,
    this.statusCode,
    this.success,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        cookie: json["cookie"],
        userId: json["user_id"],
        cookieName: json["cookie_name"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        message: json["message"],
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "cookie": cookie,
        "user_id": userId,
        "cookie_name": cookieName,
        "user": user?.toJson(),
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? nicename;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? url;
  @HiveField(5)
  DateTime? registered;
  @HiveField(6)
  String? displayname;
  @HiveField(7)
  String? firstname;
  @HiveField(8)
  String? lastname;
  @HiveField(9)
  String? nickname;
  @HiveField(10)
  String? description;
  @HiveField(11)
  List<String>? role;
  @HiveField(12)
  dynamic shipping;
  @HiveField(13)
  Billing? billing;
  @HiveField(14)
  String? avatar;
  @HiveField(15)
  int? woocommerceRewardPoints;
  @HiveField(16)
  String? password;

  User({
    this.id,
    this.username,
    this.nicename,
    this.email,
    this.url,
    this.registered,
    this.displayname,
    this.firstname,
    this.lastname,
    this.nickname,
    this.description,
    this.role,
    this.shipping,
    this.billing,
    this.avatar,
    this.woocommerceRewardPoints,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        nicename: json["nicename"],
        email: json["email"],
        url: json["url"],
        registered: json["registered"] == null
            ? null
            : DateTime.parse(json["registered"]),
        displayname: json["displayname"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        nickname: json["nickname"],
        description: json["description"],
        role: json["role"] == null
            ? []
            : List<String>.from(json["role"]!.map((x) => x)),
        shipping: json["shipping"],
        billing:
            json["billing"] == null ? null : Billing.fromJson(json["billing"]),
        avatar: json["avatar"],
        woocommerceRewardPoints: json["woocommerce_reward_points"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nicename": nicename,
        "email": email,
        "url": url,
        "registered": registered?.toIso8601String(),
        "displayname": displayname,
        "firstname": firstname,
        "lastname": lastname,
        "nickname": nickname,
        "description": description,
        "role": role == null ? [] : List<dynamic>.from(role!.map((x) => x)),
        "shipping": shipping,
        "billing": billing?.toJson(),
        "avatar": avatar,
        "woocommerce_reward_points": woocommerceRewardPoints,
      };
}

@HiveType(typeId: 1)
class Billing {
  @HiveField(0)
  String? firstName;
  @HiveField(1)
  String? lastName;
  @HiveField(2)
  String? company;
  @HiveField(3)
  String? address1;
  @HiveField(4)
  String? address2;
  @HiveField(5)
  String? city;
  @HiveField(6)
  String? state;
  @HiveField(7)
  String? postcode;
  @HiveField(8)
  String? country;
  @HiveField(9)
  String? email;
  @HiveField(10)
  String? phone;

  Billing({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
        "email": email,
        "phone": phone,
      };
}
