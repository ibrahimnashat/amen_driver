// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:amen_driver/features/auth/data/data_source/local_data_source.dart'
    as _i3;
import 'package:amen_driver/features/auth/data/repository/auth_repository_implement.dart'
    as _i6;
import 'package:amen_driver/features/auth/domain/repository/auth_repository.dart'
    as _i5;
import 'package:amen_driver/features/auth/domain/usecases/default_country_code_picker_usecase.dart'
    as _i7;
import 'package:amen_driver/features/auth/domain/usecases/show_country_code_picker_usecase.dart'
    as _i8;
import 'package:amen_driver/features/auth/presentaion/logic_design/sign_up/sign_up_bloc.dart'
    as _i9;
import 'package:amen_driver/features/splash/logic_design/splash_bloc.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.LocalDataSource>(() => _i3.LocalDataSourceImplement());
    gh.factory<_i4.SplashBloc>(() => _i4.SplashBloc());
    gh.lazySingleton<_i5.AuthRepository>(() => _i6.AuthRepositoryImplement(
        localDataSource: gh<_i3.LocalDataSource>()));
    gh.lazySingleton<_i7.DefaultCountryCodePickerUseCase>(() =>
        _i7.DefaultCountryCodePickerUseCase(
            authRepository: gh<_i5.AuthRepository>()));
    gh.lazySingleton<_i8.ShowCountryCodePickerUseCase>(() =>
        _i8.ShowCountryCodePickerUseCase(
            authRepository: gh<_i5.AuthRepository>()));
    gh.factory<_i9.SignUpBloc>(
        () => _i9.SignUpBloc(authRepository: gh<_i5.AuthRepository>()));
    return this;
  }
}
