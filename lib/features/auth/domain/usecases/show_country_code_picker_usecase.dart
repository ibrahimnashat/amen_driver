import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/core/errors/failures.dart';
import 'package:amen_driver/features/auth/domain/entity/contry_code.dart';
import 'package:amen_driver/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ShowCountryCodePickerUseCase {
  final AuthRepository authRepository;

  ShowCountryCodePickerUseCase({required this.authRepository});

  Future<Either<Failure, CountryCode>> showCountryCodePicker({
    required BuildContext context,
  }) async {
    return await authRepository.showCountryCodePicker(context: context);
  }
}
