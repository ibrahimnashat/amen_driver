// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryCodeModel _$CountryCodeModelFromJson(Map<String, dynamic> json) =>
    CountryCodeModel(
      countryCode: json['countryCode'] as String,
      flag: json['flag'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CountryCodeModelToJson(CountryCodeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flag': instance.flag,
      'countryCode': instance.countryCode,
    };
