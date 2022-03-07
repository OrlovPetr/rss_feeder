// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_feed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RSSFeedItem _$RSSFeedItemFromJson(Map<String, dynamic> json) => RSSFeedItem(
      title: json['title'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      author: json['author'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$RSSFeedItemToJson(RSSFeedItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'author': instance.author,
      'url': instance.url,
    };
