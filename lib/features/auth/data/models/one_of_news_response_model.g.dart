// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_of_news_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneOfNewsResponseModel _$OneOfNewsResponseModelFromJson(
        Map<String, dynamic> json) =>
    OneOfNewsResponseModel(
      access: json['access'] as String,
      data: NewsModel.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
      version: json['version'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$OneOfNewsResponseModelToJson(
        OneOfNewsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'version': instance.version,
      'access': instance.access,
      'data': instance.data,
    };
