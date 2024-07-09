import 'package:dio/dio.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/data/repositories/user_repository/user_repository.dart';
import 'package:groceries_app/domain/model/user.dart';
import 'package:groceries_app/domain/result.dart';

class RemoteUserRepository implements UserRepository {
  final Dio? _dio;

  RemoteUserRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<User?>> getUser({required String id}) async {
    print('getUser id: $id');
    try {
      final response = await _dio?.get('${Config.baseUrl}/users/me',
          options: Options(headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $id'
          }));

      final result = User.fromJson(response?.data['data']);
      print('result remote user repository : $result');
      return Result.success(result);
    } on DioException catch (e) {
      var err = e?.response?.data;
      print('error login authentication repository : $err');
      return Result.fail(err['message']);
    }
  }
}
