import 'package:filore/src/core/models/photo_model.dart';
// import 'package:filore/src/core/models/user_model.dart';

class PhotoCollection {
  PhotoCollection({
    required this.id,
    this.name = 'Name',
    required this.photos,
    // required this.createdBy,
  });

  String id = '';
  String name = 'Collection name';
  List<Photo> photos = [];
  // UserModel createdBy;

  // String get username => createdBy.username;
}
