//login function
import 'package:filore/src/core/models/user_model.dart';
import 'package:filore/src/core/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void loginUser(WidgetRef ref, UserModel user) {
  ref.read(userProvider.notifier).state = user;
}

void logoutUser(WidgetRef ref, UserModel user) {
  ref.read(userProvider.notifier).state = null;
}
