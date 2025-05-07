import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userhub/features/user/data/datasources/user_remote_data_source.dart';
import 'package:userhub/features/user/domain/entities/user.dart';
import 'package:userhub/features/user/domain/repositories/user_repository.dart';
import '../../domain/usecases/get_users.dart';
import '../../data/repositories/user_repository_impl.dart';
import 'package:userhub/features/user/data/services/api_service.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return UserRepositoryImpl(UserRemoteDataSource(apiService));  // Исправлено
});

final getUsersProvider = Provider<GetUsers>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return GetUsers(repository);
});

final userListProvider = FutureProvider<List<User>>((ref) async {
  final getUsers = ref.watch(getUsersProvider);
  final result = await getUsers();
  return result.fold(
    (l) => throw Exception('Ошибка при загрузке данных: $l'), // Обработка ошибки
    (r) => r,
  );
});

