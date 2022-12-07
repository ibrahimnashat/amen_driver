import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/core/errors/exceptions.dart';
import 'package:amen_driver/features/auth/data/models/country_code_model.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  Future<CountryCodeModel> getDefaultCountryCode({
    required BuildContext context,
  });
  Future<CountryCodeModel> showCountryPicker({required BuildContext context});
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImplement implements LocalDataSource {
  @override
  Future<CountryCodeModel> getDefaultCountryCode({
    required BuildContext context,
  }) async {
    final country = await getDefaultCountry(context);
    return CountryCodeModel(
      countryCode: country.countryCode,
      flag: country.flag,
      name: country.name,
    );
  }

  @override
  Future<CountryCodeModel> showCountryPicker({
    required BuildContext context,
  }) async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      return CountryCodeModel(
        countryCode: country.countryCode,
        flag: country.flag,
        name: country.name,
      );
    }
    throw CountryCodeException;
  }
}
