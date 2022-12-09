// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture/features/auth/data/data_source/remote_data_source.dart'
    as _i5;
import 'package:clean_architecture/features/auth/data/repository/news_repository_implement.dart'
    as _i4;
import 'package:clean_architecture/features/auth/domain/repository/news_repository.dart'
    as _i3;
import 'package:clean_architecture/features/auth/domain/usecases/get_all_news_usecase.dart'
    as _i6;
import 'package:clean_architecture/features/auth/domain/usecases/get_one_of_news_list_usecase.dart'
    as _i7;
import 'package:clean_architecture/features/auth/presentaion/logic_design/news/news_bloc.dart'
    as _i8;
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
    gh.lazySingleton<_i3.NewsRepository>(() => _i4.NewsRepositoryImplement(
        remoteDataSource: gh<_i5.RemoteDataSource>()));
    gh.lazySingleton<_i6.GetAllNewsUseCase>(
        () => _i6.GetAllNewsUseCase(newsRepository: gh<_i3.NewsRepository>()));
    gh.lazySingleton<_i7.GetOneOfNewsListUseCase>(() =>
        _i7.GetOneOfNewsListUseCase(newsRepository: gh<_i3.NewsRepository>()));
    gh.factory<_i8.NewsBloc>(() => _i8.NewsBloc(
          getOneOfNewsListUseCase: gh<_i7.GetOneOfNewsListUseCase>(),
          getAllNewsUseCase: gh<_i6.GetAllNewsUseCase>(),
        ));
    return this;
  }
}
