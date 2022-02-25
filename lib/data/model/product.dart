class Product {
  late final String? sId;
  late final String? titel;
  late final String? desc;
  late final String? img;
  late final List<dynamic>? category;
  late final List<String>? size;
  late final List<dynamic>? color;
  late final String? price;
  late final bool? inStock;
  late final String? createdAt;
  late final String? updatedAt;
  late final int? iV;
  bool isFav = false;
  int quantity = 1;
  bool isInCart = false;

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    titel = json['titel'];
    desc = json['desc'];
    img = json['img'];
    category = List.castFrom<dynamic, String>(json['category']);
    size = List.castFrom<dynamic, String>(json['size']);
    color = List.castFrom<dynamic, String>(json['color']);
    price = json['price'];
    inStock = json['inStock'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
