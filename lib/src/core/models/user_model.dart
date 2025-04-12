import 'package:filore/src/core/models/photo_collection_model.dart';
import 'package:filore/src/core/models/photo_model.dart';
import 'package:filore/src/utils/constants/images.dart';

class UserModel {
  String name = 'Name';
  String username = 'UserModelname';
  String id = 'ID';
  String profilePhoto = love;
  List<Photo> photos = [];
  bool isVerified = false;
  List<UserModel> followers = [];
  List<UserModel> following = [];
  int get followerCount => followers.length;
  int get followingCount => following.length;
  List<PhotoCollection> collections = [];

  // Set String
  //constructor
  UserModel({
    required this.name,
    required this.username,
    this.id = '',
    this.profilePhoto = love,
    this.isVerified = false,
    this.photos = const [],
    this.collections = const [],
    this.following = const [],
    this.followers = const [],
  });

  //  followers = followers,
  // following = following;

  /// Check if this user is inside another user's followers list
  bool isFollower(UserModel user) {
    return followers.contains(user);
  }

  /// Check if this user is NOT following another user
  bool notFollowing(UserModel user) {
    return !following.contains(user);
  }

  /// Check if this user is following another user
  bool alreadyFollowing(UserModel user) {
    return following.contains(user);
  }
}
