import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/core/errors/failures.dart';
import 'package:amen_driver/features/auth/domain/entity/contry_code.dart';
import 'package:amen_driver/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DefaultCountryCodePickerUseCase {
  final AuthRepository authRepository;

  DefaultCountryCodePickerUseCase({required this.authRepository});

  Future<Either<Failure, CountryCode>> initializeCountryCodePicker({
    required BuildContext context,
  }) async {
    return await authRepository.defaultCountryCodePicker(context: context);
  }
}
