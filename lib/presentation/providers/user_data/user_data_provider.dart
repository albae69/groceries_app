import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/domain/model/user.dart';
import 'package:groceries_app/domain/result.dart';
import 'package:groceries_app/presentation/providers/authentication/authentication_provider.dart';
import 'package:groceries_app/presentation/providers/products/products_provider.dart';
import 'package:groceries_app/presentation/providers/user_repository_provider/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userRepo = ref.read(userRepositoryProvider);

    var token = prefs.getString(Config.token);

    if (token != '') {
      var user = await userRepo.getUser(id: token!);
      return switch (user) {
        Success(value: final value) => value,
        Fail(message: _) => null
      };
    }
  }

  Future<void> login({required String email, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    state = const AsyncLoading();

    final auth = await ref
        .read(authenticationProvider)
        .login(email: email, password: password);

    final userRepo = ref.read(userRepositoryProvider);

    if (auth is Success) {
      var user = await userRepo.getUser(id: auth.result!);
      print('user data provider: user = $user');

      switch (user) {
        case Success(value: final value):
          await prefs.setString(Config.token, auth.result!);
          await prefs.setBool(Config.isLoggedIn, true);
          state = AsyncData(value);
          _getProducts();
        case Fail(:final message):
          state = AsyncError(FlutterError(message), StackTrace.current);
          state = const AsyncData(null);
      }
    }

    if (auth is Fail) {
      state = AsyncError(FlutterError(auth.errorMessage!), StackTrace.current);
      state = const AsyncData(null);
    }
  }

  void _getProducts() {
    ref.read(productsProvider.notifier).getListProduct();
  }
}
