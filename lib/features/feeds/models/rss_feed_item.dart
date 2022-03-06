import 'package:json_annotation/json_annotation.dart';
import 'package:rss_feeder/core/interfaces/json_serializable.dart';

part 'rss_feed_item.g.dart';

/// Application RSS feed item
@JsonSerializable()
class RSSFeedItem implements AppJSONSerializable {
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

  /// [LabOrderResults.fromJson]
  factory RSSFeedItem.fromJson(Map<String, dynamic> json) =>
      _$RSSFeedItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RSSFeedItemToJson(this);

  @override
  String toString() {
    final Map<String, dynamic> entityData = toJson();
    final StringBuffer result = StringBuffer('AppSettings ($hashCode): {');
    final List<String> rawData = [];

    entityData.forEach((String key, dynamic value) {
      rawData.add('$key : $value');
    });

    result.write(rawData.join(' | '));
    result.write('}\n');
    return result.toString();
  }
}
