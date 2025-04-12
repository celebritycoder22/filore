import 'package:filore/src/core/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_provider.dart'; // Import the file containing userProvider

/// Provider to check if the logged-in user is following another user
final isFollowingProvider =
    StateProvider.family<bool, UserModel>((ref, targetUser) {
  final currentUser = ref.watch(userProvider); // Get the logged-in user

  if (currentUser == null) {
    return false; // If no user is logged in, return false
  } else {
    return currentUser.alreadyFollowing(targetUser);
  } // Check follow status
});
