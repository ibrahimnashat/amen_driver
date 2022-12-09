import 'package:clean_architecture/features/auth/data/models/news_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_of_news_response_model.g.dart';

@JsonSerializable()
class ListOfNewsResponseModel {
  String status;
  int? statusCode;
  String? version;
  String access;
  List<NewsModel> data;
  ListOfNewsResponseModel({
    required this.access,
    required this.data,
    required this.status,
    required this.version,
    required this.statusCode,
  });

  factory ListOfNewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListOfNewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfNewsResponseModelToJson(this);
}
