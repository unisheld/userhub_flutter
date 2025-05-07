import 'package:dartz/dartz.dart';
import '../services/api_service.dart';
import '../models/user_model.dart'; // Импорт UserModel
import '../../domain/entities/user.dart'; // Импорт User (доменная сущность)


class UserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSource(this.apiService);

  Future<Either<Exception, List<User>>> getUsers() async {
    try {
      final response = await apiService.getUsers(); // List<UserModel>
      return Right(response.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(Exception('Failed to load users: $e'));
    }
  }
}