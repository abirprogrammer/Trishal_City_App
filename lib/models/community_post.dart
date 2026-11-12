class CommunityPost {
  final String id;
  final String authorName;
  final String authorSubtitle;
  final String timeAgo;
  final String content;
  final String category;
  final String? imageUrl;
  int likes;
  int comments;
  bool isLiked;

  CommunityPost({
    required this.id,
    required this.authorName,
    required this.authorSubtitle,
    required this.timeAgo,
    required this.content,
    required this.category,
    this.imageUrl,
    this.likes = 0,
    this.comments = 0,
    this.isLiked = false,
  });
}
