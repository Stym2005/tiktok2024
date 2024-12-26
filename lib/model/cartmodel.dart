import 'dart:convert';

Userinfo userinfoFromJson(String str) => Userinfo.fromJson(json.decode(str));

String userinfoToJson(Userinfo data) => json.encode(data.toJson());

class Userinfo {
  String userId;
  Cart cart;

  Userinfo({
    required this.userId,
    required this.cart,
  });

  factory Userinfo.fromJson(Map<String, dynamic> json) => Userinfo(
        userId: json["userId"] ?? "", // Handle missing userId
        cart: Cart.fromJson(json["cart"] ?? {}), // Handle missing cart
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "cart": cart.toJson(),
      };
}

class Cart {
  List<Item> items;
  double totalQuantity;
  double totalPrice;

  Cart({
    required this.items,
    required this.totalQuantity,
    required this.totalPrice,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        totalQuantity: json["totalQuantity"] != null
            ? (json["totalQuantity"] is int
                ? (json["totalQuantity"] as int).toDouble()
                : json["totalQuantity"])
            : 0.0,
        totalPrice: json["totalPrice"] != null
            ? (json["totalPrice"] is int
                ? (json["totalPrice"] as int).toDouble()
                : json["totalPrice"])
            : 0.0,
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalQuantity": totalQuantity,
        "totalPrice": totalPrice,
      };
}

class Item {
  String id;
  String name;
  String imageUrl;
  double price;
  double originalPrice;
  int quantity;

  Item({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] ?? "", // Handle missing id
        name: json["name"] ?? "", // Handle missing name
        imageUrl: json["imageUrl"] ?? "", // Handle missing imageUrl
        price: json["price"] is int
            ? (json["price"] as int).toDouble()
            : json["price"] ?? 0.0,
        originalPrice: json["originalPrice"] is int
            ? (json["originalPrice"] as int).toDouble()
            : json["originalPrice"] ?? 0.0,
        quantity: json["quantity"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "price": price,
        "originalPrice": originalPrice,
        "quantity": quantity,
      };
}
