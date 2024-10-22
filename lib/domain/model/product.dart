import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String productId,
    required String productName,
    required String description,
    required String imageUrl,
    required double price,
    String? createdAt,
    String? updatedAt,
    bool? isExlusive,
    bool? isBestSelling,
  }) = _Product;

  factory Product.fromJSON(Map<String, dynamic> json) => Product(
        productId: json['product_id'],
        productName: json['product_name'],
        description: json['description'],
        imageUrl: json['image_url'],
        price: double.parse(json['price']),
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        isExlusive: json['is_exclusive'],
        isBestSelling: json['is_best_selling'],
      );
}
