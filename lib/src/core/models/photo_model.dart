class Photo {
  String id = 'photoId';
  String photoUrl = 'photoUrl';
  String caption = 'image caption';
  DateTime? timePosted = DateTime.now();
  int? likeCount;
  int? bookmarkCount;
  int? commentCount;
  int? shareCount;
  List<String> hashtags = [];
  // UserModel owner;

  Photo({
    this.id = 'photo Id',
    required this.photoUrl,
    this.caption = '',
    this.likeCount,
    this.bookmarkCount,
    this.commentCount,
    this.shareCount,
    this.hashtags = const [],
    // required this.owner,
  }) : timePosted = DateTime.now();
}
