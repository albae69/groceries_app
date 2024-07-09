import 'package:groceries_app/domain/model/product.dart';
import 'package:groceries_app/domain/result.dart';

abstract interface class ProductRepository {
  Future<Result<List<Product>>> getListProduct();

  Future<Product> getProductById({required String productId});
}
