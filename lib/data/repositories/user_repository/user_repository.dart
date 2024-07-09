import 'package:groceries_app/domain/model/user.dart';
import 'package:groceries_app/domain/result.dart';

abstract interface class UserRepository {
  // from backend instead of id, its returning a token which parsed by backend in headers authorization
  Future<Result<User?>> getUser({required String id});
}
