// lib/features/user/data/repositories/user_repository_impl.dart
import 'package:dartz/dartz.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<User>>> getUsers() async {
    final result = await remoteDataSource.getUsers();
    return result.fold(
      (failure) => Left(failure),  // В случае ошибки просто передаем ошибку
      (users) => Right(users),  // Если все ок, возвращаем пользователей
    );
  }
}

