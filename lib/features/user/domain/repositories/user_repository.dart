// lib/features/user/data/repositories/user_repository.dart
import 'package:dartz/dartz.dart';
import 'package:userhub/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Exception, List<User>>> getUsers();
}
