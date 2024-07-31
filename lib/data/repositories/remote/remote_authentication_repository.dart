import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/data/repositories/authentication/authentication.dart';
import 'package:dio/dio.dart';
import 'package:groceries_app/domain/result.dart';
import 'package:groceries_app/utils/logger.dart';

class RemoteAuthenticationRepository implements Authentication {
  final Dio? _dio;

  RemoteAuthenticationRepository({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio!.post('${Config.baseUrl}/auth/login',
          data: {'email': email, 'password': password});

      logger.d('response login :$response');
      final result = Map<String, dynamic>.from(response?.data);

      if (result['success']) {
        return Result.success(result['data']['token']);
      } else {
        return Result.fail(result['message']);
      }
    } on DioException catch (e) {
      logger.e("err on login: ", error: e);
      var err = e?.response?.data;
      logger.e('error login authentication repository', error: e.message);
      if (err == null) {
        return Result.fail('Something wrong!');
      } else {
        return Result.fail(err['message']);
      }
    }
  }

  @override
  Future<Result<String>> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await _dio!.post('${Config.baseUrl}/auth/register',
          data: {'name': name, 'email': email, 'password': password});
      final result = Map<String, dynamic>.from(response?.data);

      if (result['success']) {
        return const Result.success('Successfully!');
      } else {
        return Result.fail(result['message']);
      }
    } on DioException catch (e) {
      var err = e?.response?.data;
      logger.e('error register authentication repository : ',
          error: err['message']);
      return Result.fail(err['message']);
    }
  }
}
