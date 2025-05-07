// Этот сервис взаимодействует с REST API для получения данных о пользователях.
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/user_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Метод для получения списка пользователей
  @GET("/users")
  Future<List<UserModel>> getUsers();
}
