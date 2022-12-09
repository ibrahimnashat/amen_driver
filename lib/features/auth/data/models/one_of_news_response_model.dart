import 'package:clean_architecture/features/auth/data/models/news_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'one_of_news_response_model.g.dart';

@JsonSerializable()
class OneOfNewsResponseModel {
  String status;
  int? statusCode;
  String? version;
  String access;
  NewsModel data;
  OneOfNewsResponseModel({
    required this.access,
    required this.data,
    required this.status,
    required this.version,
    required this.statusCode,
  });

  factory OneOfNewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OneOfNewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$OneOfNewsResponseModelToJson(this);
}
