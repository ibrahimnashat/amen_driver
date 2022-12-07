import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/core/errors/failures.dart';
import 'package:amen_driver/features/auth/domain/entity/contry_code.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, CountryCode>> showCountryCodePicker({
    required BuildContext context,
  });
  Future<Either<Failure, CountryCode>> defaultCountryCodePicker({
    required BuildContext context,
  });
}
