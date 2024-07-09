import 'package:groceries_app/data/repositories/product_repository/product_repository.dart';
import 'package:groceries_app/data/repositories/remote/remote_product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) =>
    RemoteProductRepository();
