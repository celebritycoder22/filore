class Photo {
  String id = 'photoId';
  String photoUrl = 'photoUrl';
  String caption = 'image caption';
  DateTime? timePosted = DateTime.now();
  int likeCount = 0;
  int bookmarkCount = 0;
  int commentCount = 0;
  int shareCount = 0;
  // UserModel owner;

  Photo({
    this.id = 'photo Id',
    required this.photoUrl,
    this.caption = '',
    this.likeCount = 0,
    this.bookmarkCount = 0,
    this.commentCount = 0,
    this.shareCount = 0,
    // required this.owner,
  }) : timePosted = DateTime.now();
}
