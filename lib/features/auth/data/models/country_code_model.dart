import 'package:amen_driver/features/auth/domain/entity/contry_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_code_model.g.dart';

@JsonSerializable()
class CountryCodeModel extends CountryCode {
  final String countryCode;

  const CountryCodeModel({
    required this.countryCode,
    required super.flag,
    required super.name,
  });

  factory CountryCodeModel.fromJson(Map<String, dynamic> json) =>
      _$CountryCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryCodeModelToJson(this);
}
