import 'package:groceries_app/data/repositories/authentication/authentication.dart';
import 'package:groceries_app/data/repositories/remote/remote_authentication_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
Authentication authentication(AuthenticationRef ref) =>
    RemoteAuthenticationRepository();
