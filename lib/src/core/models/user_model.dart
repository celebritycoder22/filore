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

  //constructor
  UserModel({
    required this.name,
    required this.username,
    this.id = '',
    this.profilePhoto = love,
    this.isVerified = false,
    this.photos = const [],
    List<UserModel>? followers,
    List<UserModel>? following,
  })  : followers = followers ?? [],
        following = following ?? [];
}
