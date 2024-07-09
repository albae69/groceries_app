import 'package:dio/dio.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/data/repositories/product_repository/product_repository.dart';
import 'package:groceries_app/domain/model/product.dart';
import 'package:groceries_app/domain/result.dart';

class RemoteProductRepository implements ProductRepository {
  final Dio? _dio;

  RemoteProductRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Product>>> getListProduct() async {
    try {
      final response = await _dio?.get('${Config.baseUrl}/products');

      final data = List<Map<String, dynamic>>.from(response?.data['data']);

      final result = data.map((e) => Product.fromJSON(e)).toList();

      print('results: $result');

      return Result.success(result);
    } on DioException catch (e) {
      print('error while get list product : ${e.message!}');
      return Result.fail(e.message!);
    }
  }

  @override
  Future<Product> getProductById({required String productId}) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
}