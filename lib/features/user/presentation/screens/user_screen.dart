import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';

class UserScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: users.when(
        data: (users) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          // Улучшенная ошибка с детализированным сообщением
          return Center(child: Text('Ошибка при загрузке пользователей: $err'));
        },
      ),
    );
  }
}

