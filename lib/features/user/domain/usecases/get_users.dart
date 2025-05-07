import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Exception, List<User>>> call() => repository.getUsers();
}
