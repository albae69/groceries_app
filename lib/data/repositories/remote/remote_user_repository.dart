import 'package:dio/dio.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/data/repositories/user_repository/user_repository.dart';
import 'package:groceries_app/domain/model/user.dart';
import 'package:groceries_app/domain/result.dart';
import 'package:groceries_app/utils/logger.dart';

class RemoteUserRepository implements UserRepository {
  final Dio? _dio;

  RemoteUserRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<User?>> getUser({required String id}) async {
    try {
      final response = await _dio?.get('${Config.baseUrl}/users/me',
          options: Options(headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $id'
          }));

      final result = User.fromJson(response?.data['data']);
      logger.d('result remote user repository : $result');
      return Result.success(result);
    } on DioException catch (e) {
      var err = e?.response?.data;
      logger.e('error login authentication repository : ',
          error: err['message']);
      return Result.fail(err['message']);
    }
  }
}
