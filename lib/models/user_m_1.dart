import 'dart:convert';

UserModel1 userModel1FromJson(String str) =>
    UserModel1.fromJson(json.decode(str));

String userModel1ToJson(UserModel1 data) => json.encode(data.toJson());

class UserModel1 {
  UserModel1({
    required this.message,
    required this.data,
  });

  final String message;
  final List<Datum> data;

  factory UserModel1.fromJson(Map<String, dynamic> json) => UserModel1(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productImage,
    this.v,
  });

  final String? id;
  final String? productName;
  final String? productDescription;
  final dynamic? productPrice;
  final String? productImage;
  final int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        productName: json["productName"],
        productDescription: json["productDescription"],
        productPrice: json["productPrice"],
        productImage: json["productImage"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productName": productName,
        "productDescription": productDescription,
        "productPrice": productPrice,
        "productImage": productImage,
        "__v": v,
      };
}
