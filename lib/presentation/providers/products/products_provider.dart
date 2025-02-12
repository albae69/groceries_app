import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/domain/model/product.dart';
import 'package:groceries_app/domain/result.dart';
import 'package:groceries_app/presentation/providers/product_repository_provider/product_repository_provider.dart';
import 'package:groceries_app/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@Riverpod(keepAlive: true)
class Products extends _$Products {
  @override
  Future<List<Product>> build() async => [];

  Future<void> getListProduct(
      {int page = 1, Map<String, dynamic>? params}) async {
    try {
      state = const AsyncLoading();
      final productRepository = ref.read(productRepositoryProvider);
      final results = await productRepository.getListProduct(params: params);

      switch (results) {
        case Success(value: final value):
          state = AsyncData(value);
        case Fail(:final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
          state = const AsyncData([]);
      }
    } on DioException catch (e) {
      logger.e('error getListProduct from provider:', error: e.message);
      state = AsyncError(FlutterError(e.message!), StackTrace.current);
      state = const AsyncData([]);
    }
  }
}
