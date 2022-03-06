/// Application RSS feed item
class RSSFeedItem {
  /// RSS feed item item
  final String? title;

  /// RSS feed item date
  final DateTime? date;

  /// RSS feed item author
  final String? author;

  /// RSS feed item url
  final String? url;

  /// Default [RSSFeedItem] constructor
  RSSFeedItem({
    required this.title,
    required this.date,
    required this.author,
    required this.url,
  });

  @override
  String toString() =>
      'RSSFeedItem ($hashCode): {title: $title | date: $date | author: $author | url: $url}';
}
