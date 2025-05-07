import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart'; // добавьте эту часть для генерации кода

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json); // генерируем fromJson
}

extension UserModelMapper on UserModel {
  User toDomain() {
    return User(id: id, name: name, email: email);
  }
}

