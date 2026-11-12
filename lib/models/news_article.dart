class NewsArticle {
  final String id;
  final String title;
  final String date;
  final String tag;
  final String imageUrl;
  final String summary;
  final String content;
  final String author;
  final String readTime;
  final bool isFeatured;

  const NewsArticle({
    required this.id,
    required this.title,
    required this.date,
    required this.tag,
    required this.imageUrl,
    required this.summary,
    required this.content,
    required this.author,
    required this.readTime,
    this.isFeatured = false,
  });
}
