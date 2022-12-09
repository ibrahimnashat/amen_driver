import 'package:clean_architecture/features/auth/domain/entity/news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends News {
  final String published;

  const NewsModel({
    required this.published,
    required super.id,
    required super.link,
    required super.summary,
    required super.title,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
