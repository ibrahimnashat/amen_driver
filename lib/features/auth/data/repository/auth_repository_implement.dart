import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/core/errors/exceptions.dart';
import 'package:amen_driver/features/auth/data/data_source/local_data_source.dart';
import 'package:amen_driver/features/auth/domain/entity/contry_code.dart';
import 'package:amen_driver/core/errors/failures.dart';
import 'package:amen_driver/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImplement implements AuthRepository {
  final LocalDataSource localDataSource;

  AuthRepositoryImplement({required this.localDataSource});
  @override
  Future<Either<Failure, CountryCode>> defaultCountryCodePicker({
    required BuildContext context,
  }) async {
    try {
      final country =
          await localDataSource.getDefaultCountryCode(context: context);
      return Right(country);
    } catch (e) {
      return Left(CountryCodeFailure());
    }
  }

  @override
  Future<Either<Failure, CountryCode>> showCountryCodePicker({
    required BuildContext context,
  }) async {
    try {
      final country = await localDataSource.showCountryPicker(context: context);
      return Right(country);
    } on CountryCodeException {
      return Left(CountryCodeFailure());
    }
  }
}
