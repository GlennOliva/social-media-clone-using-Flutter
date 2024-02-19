class UserPost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  final String numComments;
  final String numShare;
  bool isliked;


  UserPost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numComments,
    required this.numShare,
    required this.isliked,
  });
}