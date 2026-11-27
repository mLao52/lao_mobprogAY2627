class SocialPost {
  const SocialPost({
    required this.userName,
    required this.content,
    required this.date,
    required this.numOfLikes,
    this.hasImage = false,
    this.imageUrl,
    this.avatarUrl,
  });

  final String userName;
  final String content;
  final DateTime date;
  final int numOfLikes;
  final bool hasImage;
  final String? imageUrl;
  final String? avatarUrl;
}
