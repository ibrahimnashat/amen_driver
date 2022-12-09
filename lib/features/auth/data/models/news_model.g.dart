// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      published: json['published'] as String,
      id: json['id'] as int,
      link: json['link'] as String?,
      summary: json['summary'] as String?,
      title: json['title'] as String,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'link': instance.link,
      'published': instance.published,
    };
