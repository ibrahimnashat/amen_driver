// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_news_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListOfNewsResponseModel _$ListOfNewsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ListOfNewsResponseModel(
      access: json['access'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      version: json['version'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$ListOfNewsResponseModelToJson(
        ListOfNewsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'version': instance.version,
      'access': instance.access,
      'data': instance.data,
    };
