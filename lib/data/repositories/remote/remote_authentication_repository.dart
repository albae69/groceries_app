import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/data/repositories/authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:groceries_app/domain/result.dart';

class RemoteAuthenticationRepository implements Authentication {
  final Dio? _dio;

  RemoteAuthenticationRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio!.post('${Config.baseUrl}/auth/login',
          data: {'email': email, 'password': password});
      final result = Map<String, dynamic>.from(response?.data);

      print('result authentication: $result');

      bool isSuccess = result['success'];
      if (isSuccess) {
        return Result.success(result['data']['token']);
      } else {
        return Result.fail(result['message']);
      }
    } on DioException catch (e) {
      var err = e?.response?.data;
      print('error login authentication repository : $err');
      return Result.fail(err['message']);
    }
  }
}
