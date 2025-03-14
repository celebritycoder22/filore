import 'package:filore/src/core/data/user_data.dart';
import 'package:filore/src/core/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider<UserModel?>((ref) {
  return UserData.usersList[0]; // Initially, no user logged in
});
