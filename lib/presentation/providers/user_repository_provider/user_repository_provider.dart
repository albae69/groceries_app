import 'package:groceries_app/data/repositories/remote/remote_user_repository.dart';
import 'package:groceries_app/data/repositories/user_repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => RemoteUserRepository();
