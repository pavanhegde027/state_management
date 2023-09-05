import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import '../repo/repositories.dart';

final globalProvider = Provider<UserRepository>((ref) => UserRepository());

final getUserList = FutureProvider<User>((ref) {

  final repository = ref.watch(globalProvider);
  return repository.getUsers();
});