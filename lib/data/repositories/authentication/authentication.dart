import 'package:groceries_app/domain/result.dart';

abstract interface class Authentication {
  Future<Result<String>> login(
      {required String email, required String password});
}