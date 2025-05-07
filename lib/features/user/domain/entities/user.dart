// lib/features/user/domain/entities/user.dart
class User {
  final int id;
  final String name;
  final String email;

  const User({
    required this.id,
    required this.name,
    required this.email,
  });
}
